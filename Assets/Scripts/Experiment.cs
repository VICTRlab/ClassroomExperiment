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
        InClassroom,
        Seated,
        End
    }

    public Progress CurrentProgress = Progress.Begin;

    public string participantAvatarFile;
    public GameObject participantAvatar;
    public Transform participantSkeletonRoot;
    public Transform participantStart;

    public float avatarScale = 0.01f;

	// Use this for initialization
	void Start ()
    {
        Instance = this;
        UnityEngine.XR.XRSettings.enabled = false;

        var ovrGO = GameObject.Find("OVRCameraRig");

        var ovrManager = ovrGO.GetComponent<OVRManager>();
        ovrManager.enabled = false;

        var ovrCameraRig = ovrGO.GetComponent<OVRCameraRig>();
        ovrCameraRig.enabled = false;

        //ovrManager.SetActive(false);
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public void LoadParticipantAvatar(string fbxPath)
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

                assetLoader.LoadFromFile(fbxPath, loaderOptions, participantAvatar);

                participantAvatarFile = fbxPath;

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

    private void OnGUI()
    {
        if (GUILayout.Button("Load model"))
        {
            var selectedFile = StandaloneFileBrowser.OpenFilePanel("Choose participant avatar", "", "fbx", false);

            if (selectedFile.Length > 0)
            {
                var fileInfo = new FileInfo(selectedFile[0]);

                if (fileInfo.Exists)
                {
                    LoadParticipantAvatar(fileInfo.FullName);
                }
            }
        }

        if (!string.IsNullOrEmpty(participantAvatarFile))
        {
            GUILayout.Label(participantAvatarFile);
        }
    }
}
