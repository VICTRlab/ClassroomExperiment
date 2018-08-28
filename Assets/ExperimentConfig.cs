using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using SFB;

public class ExperimentConfig : MonoBehaviour {

    private static bool created = false;
    public static ExperimentConfig Instance;

    public string participantAvatarFile;
    public string videoFile;

    public bool readyToStart = false;
    public bool experimentStarted = false;

    public enum InterfaceMode
    {
        Desktop,
        VR
    }

    public InterfaceMode interfaceMode;

    private void Awake()
    {
        if (!created)
        {
            DontDestroyOnLoad(gameObject);
            created = true;
            Instance = this;
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
		if (readyToStart && !experimentStarted)
        {
            experimentStarted = true;
            StartCoroutine(StartExperiment());
        }
	}

    IEnumerator StartExperiment()
    {
        if (interfaceMode == InterfaceMode.VR)
        {
            UnityEngine.XR.XRSettings.LoadDeviceByName("Oculus");
        }
        else
        {
            UnityEngine.XR.XRSettings.LoadDeviceByName("");
        }

        yield return new WaitForEndOfFrame();

        SceneManager.LoadScene("ClassroomVideo");

        yield break;
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
        if (experimentStarted) return;

        GUILayout.BeginHorizontal();
        if (GUILayout.Button("Load model"))
        {
            participantAvatarFile = LoadFile("Choose participant avatar", "", "fbx");
        }

        if (!string.IsNullOrEmpty(participantAvatarFile))
        {
            GUILayout.Label("Avatar file: " + participantAvatarFile);
        }

        GUILayout.EndHorizontal();

        GUILayout.BeginVertical();

        GUILayout.BeginHorizontal();
        if (GUILayout.Button("Load video"))
        {
            videoFile = LoadFile("Choose video clip", "", "mp4");
        }

        if (!string.IsNullOrEmpty(videoFile))
        {
            GUILayout.Label("Video file: " + videoFile);
        }

        GUILayout.EndHorizontal();

        //GUILayout.BeginHorizontal();

        //GUILayout.Label("Video volume");
        //volumeControl = GUILayout.HorizontalSlider(volumeControl, 0.0f, 1.0f);

        //if (projectorController.audioSource.volume != volumeControl)
        //{
        //    projectorController.audioSource.volume = volumeControl;
        //}

        //GUILayout.EndHorizontal();

        GUILayout.EndVertical();

        string interfaceStr = interfaceMode.ToString();
        if (GUILayout.Button(interfaceStr))
        {
            interfaceMode = (InterfaceMode)(1 - (int)interfaceMode);
        }

        if (GUILayout.Button("Start"))
        {
            readyToStart = true;
        }
    }
}
