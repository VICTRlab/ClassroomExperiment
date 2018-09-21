using System;
using System.IO;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SFB;

public class Experiment : MonoBehaviour {

    public static Experiment Instance;

    public enum Progress
    {
        Begin,
        SelectedAvatar,
        Seated,
        VideoStarted,
        End
    }

    public Progress CurrentProgress = Progress.Begin;

    public GameObject participantAvatar;
    public Transform participantSkeletonRoot;
    public Transform participantStart;

    public float avatarScale = 0.01f;

    public float SitTime = 1.0f;

    bool startedSitting = false;

    public Canvas fadeCanvas;

    public VideoController projectorController;
    public PercentVisibleTracker screenTracker;

    public Seat seat;
    public ArrowPulse arrow;

    public UnityStandardAssets.Characters.FirstPerson.FirstPersonController fps;

    public int frameNumber = 0;
    public DateTime recordingBeganAt;
    public bool currentlyRecording = false;
    StreamWriter recordingStream;

    List<string> experimentEvents = new List<string>();

    private void Awake()
    {
        Instance = this;

        if (ExperimentConfig.Instance.interfaceMode == ExperimentConfig.InterfaceMode.Desktop)
        {
            UnityEngine.XR.XRSettings.enabled = false;

            var ovrGO = GameObject.Find("OVRCameraRig");

            var ovrManager = ovrGO.GetComponent<OVRManager>();
            ovrManager.enabled = false;

            var ovrCameraRig = ovrGO.GetComponent<OVRCameraRig>();
            ovrCameraRig.enabled = false;
        }
        else
        {
            UnityEngine.XR.XRSettings.enabled = true;
        }

        if (!string.IsNullOrEmpty(ExperimentConfig.Instance.sessionAvatar))
        {
            LoadParticipantAvatar(ExperimentConfig.Instance.sessionAvatar);
        }

        if (!string.IsNullOrEmpty(ExperimentConfig.Instance.videoFile))
        {
            LoadVideoFromFile(ExperimentConfig.Instance.videoFile);
        }
    }

    /// <summary>
    /// Fires when the character sits down at the desk. Yields on fixed update because it
    /// modifies character position and look direction.
    /// </summary>
    /// <returns></returns>
    IEnumerator SitDown()
    {
        if (startedSitting) yield break;
        startedSitting = true;

        float t = 0.0f;

        var fpsRB = fps.GetComponent<Rigidbody>();

        Vector3 startPos = fps.transform.position;
        Vector3 endPos = seat.transform.position + new Vector3(0, -0.25f, 0);
        Quaternion startRot = fps.transform.rotation;
        Quaternion endRot = seat.transform.rotation;

        Vector3 lookTowards = projectorController.transform.position - seat.transform.position;

        endRot = Quaternion.LookRotation(lookTowards.normalized, Vector3.up);

        while (t <= SitTime)
        {
            float lt = t / SitTime;
            fps.transform.position = Vector3.Lerp(startPos, endPos, lt);
            fps.transform.rotation = Quaternion.Slerp(startRot, endRot, lt);

            t += Time.deltaTime;
            yield return new WaitForFixedUpdate();
        }

        CurrentProgress = Progress.Seated;
        Debug.Log("Seated");
        fps.sitting = true;
        yield break;
    }

    public void SendSignal(string msg)
    {
        Debug.Log(msg);
        experimentEvents.Add(msg);
        // TODO: insert BIOPAC TTL message here
    }
	
	// Update is called once per frame
	void Update ()
    {
        // Check for sit down event
        if (CurrentProgress == Progress.SelectedAvatar && seat.InRange && Input.GetButton("XboxA") && !fps.sitting
            && !startedSitting) 
        {
            arrow.gameObject.SetActive(false);
            //fps.transform.parent = seat.transform;
            StartCoroutine(SitDown());
            return;
        }

        if (CurrentProgress == Progress.Seated && Input.GetButton("XboxA"))
        {
            StartVideo();
            return;
        }

        if (currentlyRecording)
        {
            UpdateRecording();
        }
	}

    /// <summary>
    /// Starts recording experiment data
    /// </summary>
    void BeginRecording()
    {
        frameNumber = 0;
        currentlyRecording = true;
        recordingBeganAt = DateTime.Now;
        var nowStr = string.Format("{0}-{1}-{2}-{3}-{4}-{5}", recordingBeganAt.Year, recordingBeganAt.Month,
                recordingBeganAt.Day, recordingBeganAt.Hour, recordingBeganAt.Minute, recordingBeganAt.Second);
        var recordingStreamPath = string.Format("{0}/{1}/unitydata-{2}.csv",
            ExperimentConfig.Instance.dataFolder, ExperimentConfig.Instance.sessionName, nowStr);

        var fi = new FileInfo(recordingStreamPath);
        if (!fi.Directory.Exists)
        {
            fi.Directory.Create();
        }
        // Write a config file in the same location listing the avatar filename, video clip, and distraction source
        using (var outLog = File.Create(string.Format("{0}/settings-{1}.txt", fi.FullName, nowStr)))
        using (var logOut = new StreamWriter(outLog))
        {
            logOut.WriteLine("Session avatar: " + ExperimentConfig.Instance.sessionAvatar);
            logOut.WriteLine("Session name: " + ExperimentConfig.Instance.sessionName);
            logOut.WriteLine("Video clip: " + ExperimentConfig.Instance.videoFile);
            if (ExperimentConfig.Instance.eventsFromFile)
            {
                logOut.WriteLine("Event source: " + ExperimentConfig.Instance.eventCues);
            }
            else
            {
                logOut.WriteLine("Event source: auto-generated");
            }   
        }

        recordingStream = new StreamWriter(new FileStream(recordingStreamPath, FileMode.Create, FileAccess.Write));

        string header="Frame,UnityTime,VideoTime,PosX,PosY,PosZ,AngleX,AngleY,AngleZ,ScreenLookScore,ScreenPercentVisible,Events";

        recordingStream.WriteLine(header);
    }

    /// <summary>
    /// Writes current experiment state out to CSV file
    /// </summary>
    void UpdateRecording()
    {
        TimeSpan diff = DateTime.Now - recordingBeganAt;
        var headPos = fps.head.position;
        var headRot = fps.head.rotation.eulerAngles;
        string events = string.Empty;
        if (experimentEvents.Any())
        {
            events = string.Join(";", experimentEvents.ToArray());
            experimentEvents.Clear();
        }
        string entry = string.Format("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11}",
            frameNumber,
            diff.TotalSeconds,
            projectorController.player.time,
            headPos.x, headPos.y, headPos.z,
            headRot.x, headRot.y, headRot.z,
            screenTracker.lookScore,
            screenTracker.percentVisible,
            events);

        recordingStream.WriteLine(entry);

        frameNumber++;
    }

    /// <summary>
    /// Closes recording stream
    /// </summary>
    void EndRecording()
    {
        UpdateRecording();
        currentlyRecording = false;
        recordingStream.Close();
        recordingStream = null;
    }

    /// <summary>
    /// Starts playing video, recording experiment data
    /// </summary>
    public void StartVideo()
    {
        CurrentProgress = Progress.VideoStarted;
        Distractions.Instance.PrepareDistractions();
        BeginRecording();
        SendSignal("Starting video");
        projectorController.player.Play();
        projectorController.player.loopPointReached += (src) =>
        {
            StopVideo();
        };
    }

    /// <summary>
    /// Fires when video clip stops to signal end of experiment.
    /// </summary>
    public void StopVideo()
    {
        CurrentProgress = Progress.End;
        SendSignal("Video finished. Shutting down...");
        EndRecording();
        projectorController.player.Stop();
        StartCoroutine(FadeOut());
    }

    /// <summary>
    /// Fades the screen out to black when the video ends
    /// </summary>
    /// <returns></returns>
    IEnumerator FadeOut()
    {
        Debug.Log("Fading out...");

        var cg = fadeCanvas.GetComponent<CanvasGroup>();

        float fadeTime = 5.0f;

        float t = 0.0f;

        while (t < fadeTime)
        {
            t += Time.deltaTime;

            cg.alpha = t / fadeTime;
            yield return null;
        }

        cg.interactable = false;

        Application.Quit();

        yield return null;
        
    }

    public void LoadParticipantAvatar(string participantAvatarFile)
    {
        using (var assetLoader = new TriLib.AssetLoader())
        {
            try
            {
                //var loaderOptions = new TriLib.AssetLoaderOptions();
                var loaderOptions = ScriptableObject.CreateInstance<TriLib.AssetLoaderOptions>();
                loaderOptions.DontLoadCameras = true;
                loaderOptions.DontLoadLights = true;

                if (participantAvatar != null)
                {
                    Destroy(participantAvatar);
                    participantAvatar = null;
                }

                participantAvatar = new GameObject("Participant");

                assetLoader.LoadFromFile(participantAvatarFile, loaderOptions, participantAvatar);

                //participantAvatar = newParticipantAvatar;
                var hipQuery = participantAvatar.GetComponentsInChildren<Transform>()
                    .Where(f => f.name == "Hip").ToList();
                if (hipQuery.Any())
                {
                    participantSkeletonRoot = hipQuery.First();
                }

                participantAvatar.transform.localScale = Vector3.one * avatarScale;
                participantAvatar.transform.position = participantStart.transform.position;
                participantAvatar.transform.rotation = participantStart.transform.rotation;

                CurrentProgress = Progress.SelectedAvatar;
            }
            catch(Exception ex)
            {
                Debug.LogError(ex.ToString());
            }
        }
    }

    public void LoadVideoFromFile(string videoFile)
    {
        try
        {
            projectorController.player.url = videoFile;
            //projectorController.player.Play();
        }
        
        catch (Exception ex)
        {
            Debug.LogError(ex.ToString());
        }
    }

    string LoadFile(string label, string dir, string ext = "")
    {
        var selectedFile = StandaloneFileBrowser.OpenFilePanel(label, dir, ext, false);

        if (selectedFile.Length > 0)
        {
            var fileInfo = new FileInfo(selectedFile[0]);

            if (fileInfo.Exists)
            {
                return fileInfo.FullName;
            }
        }

        return string.Empty;
    }
}
