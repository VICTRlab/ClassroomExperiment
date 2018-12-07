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

    public RuntimeAnimatorController participantController;

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
        Vector3 endPos = seat.transform.position;// + new Vector3(0, -0.25f, 0);
        endPos.y = startPos.y;
        Quaternion startRot = fps.transform.rotation;
        Quaternion endRot = seat.transform.rotation;

        Vector3 lookTowards = projectorController.transform.position - seat.transform.position;

        endRot = Quaternion.LookRotation(lookTowards.normalized, Vector3.up);

        // Flag that sit down animation should begin
        fps.animSatDown = true;

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

    public void SendSignal(string msg, float length, 
        Distractions.Distraction distraction = Distractions.Distraction.None)
    {
        Debug.Log(msg);
        experimentEvents.Add(msg);
        if (distraction != Distractions.Distraction.None)
        {
            StartCoroutine(SendTTL(length, distraction));
        }
    }

    Distractions.Distraction currentTTL = Distractions.Distraction.None;

    static readonly Dictionary<Distractions.Distraction, string> ttl_codes =
        new Dictionary<Distractions.Distraction, string>
        {
            {Distractions.Distraction.None, "00" },
            {Distractions.Distraction.HumanAudio, "01" },
            {Distractions.Distraction.HumanVisual, "02" },
            {Distractions.Distraction.TechAudio, "03" },
            {Distractions.Distraction.TechVisual, "04" },
            {Distractions.Distraction.StartVideo, "05" },
            {Distractions.Distraction.StopVideo, "06" },
            {Distractions.Distraction.Mirror, "07" },
            {Distractions.Distraction.Reset, "RR" },
        };

    IEnumerator SendTTL(float length, Distractions.Distraction distraction)
    {
        if (currentTTL != Distractions.Distraction.None)
        {
            Serial.Write(ttl_codes[Distractions.Distraction.None]);
            Debug.Log("TTL code " + currentTTL + " was live, so writing stop code");
            currentTTL = Distractions.Distraction.None;
        }
        string code = ttl_codes[distraction];
        Debug.Log("Writing TTL: " + distraction + "(" + code + ")");
        Serial.Write(code);
        // Reset just happens once at the beginning, so don't track it or try to erase afterward
        if (distraction != Distractions.Distraction.Reset)
        {
            currentTTL = distraction;

            if (length > 0.0f)
            {
                yield return new WaitForSeconds(length);
                if (currentTTL != Distractions.Distraction.None)
                {
                    Serial.Write(ttl_codes[Distractions.Distraction.None]);
                    Debug.Log("Writing stop code: " + ttl_codes[Distractions.Distraction.None]);
                    currentTTL = Distractions.Distraction.None;
                }
            }
        }
        
        yield break;
    }

    private void Start()
    {
        BeginRecording();
    }

    // Update is called once per frame
    void Update ()
    {
        // Check for sit down event
        if (Input.GetButtonDown("XboxA"))
        {
            if (CurrentProgress == Progress.SelectedAvatar 
                && seat.InRange && !fps.sitting && !startedSitting)
            {
                arrow.gameObject.SetActive(false);
                //fps.transform.parent = seat.transform;
                StartCoroutine(SitDown());
                return;
            }

            if (CurrentProgress == Progress.Seated)
            {
                StartCoroutine(StartVideoDelayed(3.0f));
                return;
            }
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
        using (var outLog = File.Create(string.Format("{0}/settings-{1}.txt", fi.Directory.FullName, nowStr)))
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

        recordingStream = new StreamWriter(fi.OpenWrite());

        string header="Frame,UnityTime,VideoTime,PosX,PosY,PosZ,AngleX,AngleY,AngleZ,ScreenLookScore,ScreenPercentVisible,Events";

        recordingStream.WriteLine(header);

        SendSignal("Initializing TTL", 0.0f, Distractions.Distraction.Reset);
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

    IEnumerator StartVideoDelayed(float seconds)
    {
        SendSignal("Started video playback", seconds, Distractions.Distraction.StartVideo);
        yield return new WaitForSeconds(seconds);
        CurrentProgress = Progress.VideoStarted;
        Distractions.Instance.PrepareDistractions();
        
        projectorController.player.Play();
        projectorController.player.loopPointReached += (src) =>
        {
            StartCoroutine(StopVideo(seconds));
        };
        yield break;
    }

    /// <summary>
    /// Fires when video clip stops to signal end of experiment.
    /// </summary>
    public IEnumerator StopVideo(float seconds)
    {
        CurrentProgress = Progress.End;
        projectorController.player.Stop();
        SendSignal("Video finished. Shutting down in " + seconds.ToString() + " seconds...", seconds,
            Distractions.Distraction.Reset);
        yield return new WaitForSeconds(seconds);
        EndRecording();
        
        StartCoroutine(FadeOut());

        yield break;
    }

    /// <summary>
    /// Fades the screen out to black when the video ends
    /// </summary>
    /// <returns></returns>
    IEnumerator FadeOut()
    {
        Debug.Log("Fading out...");

        var cg = fadeCanvas.GetComponent<CanvasGroup>();

        float fadeTime = 3.0f;

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

                loaderOptions.AddAnimationSubclip("Walk", new Vector2Int(0, 83));
                loaderOptions.AddAnimationSubclip("Sit", new Vector2Int(84, 97), WrapMode.Once);
                loaderOptions.AddAnimationSubclip("Idle", new Vector2Int(100, 300));
                loaderOptions.DefaultAnimationClip = "Idle";



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

                var playerObj = GameObject.Find("Player");
                if (playerObj)
                {
                    participantAvatar.transform.parent = playerObj.transform;

                    participantAvatar.transform.rotation *= Quaternion.Euler(0, 180f, 0);
                }

                // Look for neck in participant avatar
                Stack<Transform> participantBones = new Stack<Transform>();
                participantBones.Push(participantAvatar.transform);
                
                while (participantBones.Any())
                {
                    var bone = participantBones.Pop();
                    if (bone.gameObject.name.ToLower().Contains("head"))
                    {
                        var ma = bone.gameObject.AddComponent<MovementAnimations>();
                        ma.neck = bone;
                        break;
                    }
                    else
                    {
                        for(int i = 0; i < bone.childCount; i++)
                        {
                            participantBones.Push(bone.GetChild(i));
                        }
                    }
                }

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
