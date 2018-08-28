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

    public VideoController projectorController;

    public Seat seat;
    public ArrowPulse arrow;

    public UnityStandardAssets.Characters.FirstPerson.FirstPersonController fps;

    //float volumeControl = 1.0f;

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

        if (!string.IsNullOrEmpty(ExperimentConfig.Instance.participantAvatarFile))
        {
            LoadParticipantAvatar(ExperimentConfig.Instance.participantAvatarFile);
        }

        if (!string.IsNullOrEmpty(ExperimentConfig.Instance.videoFile))
        {
            LoadVideoFromFile(ExperimentConfig.Instance.videoFile);
        }
    }

    IEnumerator SitDown()
    {
        if (startedSitting) yield break;
        startedSitting = true;

        float t = 0.0f;

        var fpsRB = fps.GetComponent<Rigidbody>();

        Vector3 startPos = fps.transform.position;
        Vector3 endPos = seat.transform.position + new Vector3(0, -0.25f, 0);
        Quaternion startRot = fps.transform.rotation;
        Quaternion endRot = seat.transform.rotation;// Quaternion.AngleAxis(90.0f, Vector3.up);

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
        // TODO: insert BIOPAC TTL message here
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (CurrentProgress == Progress.SelectedAvatar && seat.Seated && Input.GetButton("XboxA") && !fps.sitting
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
	}

    public void StartVideo()
    {
        CurrentProgress = Progress.VideoStarted;
        SendSignal("Starting video");
        projectorController.player.Play();
        //StartCoroutine(CheckVideoStatus());
        projectorController.player.loopPointReached += (src) =>
        {
            StopVideo();
        };
    }

    private void Player_loopPointReached(UnityEngine.Video.VideoPlayer source)
    {
        throw new NotImplementedException();
    }

    public void StopVideo()
    {
        CurrentProgress = Progress.End;
        SendSignal("Video finished");
        projectorController.player.Stop();
    }

    //public IEnumerator CheckVideoStatus()
    //{
    //    if (projectorController == null) yield break;

    //    yield return new WaitForSeconds(1.0f);

    //    while (projectorController.player.isPlaying)
    //    {
    //        yield return null;
    //    }

    //    StopVideo();
    //}

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

    private void OnGUI()
    {
        //GUILayout.BeginHorizontal();
        //if (GUILayout.Button("Load model"))
        //{
        //    participantAvatarFile = LoadFile("Choose participant avatar", "", "fbx");

        //    if (!string.IsNullOrEmpty(participantAvatarFile))
        //    {
        //        LoadParticipantAvatar();
        //    }
        //}

        //if (!string.IsNullOrEmpty(participantAvatarFile))
        //{
        //    GUILayout.Label(participantAvatarFile);
        //}

        //GUILayout.EndHorizontal();

        //GUILayout.BeginVertical();
        //if (GUILayout.Button("Load video"))
        //{

        //    videoFile = LoadFile("Choose video clip", "", "mp4");

        //    if (!string.IsNullOrEmpty(videoFile))
        //    {
        //        LoadVideoFromFile();
        //    }
        //}


        //GUILayout.BeginHorizontal();

        //GUILayout.Label("Video volume");
        //volumeControl = GUILayout.HorizontalSlider(volumeControl, 0.0f, 1.0f);

        //if (projectorController.audioSource.volume != volumeControl)
        //{
        //    projectorController.audioSource.volume = volumeControl;
        //}

        //GUILayout.EndHorizontal();
    }
}
