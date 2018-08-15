using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SFB;

public class IMMenu : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnGUI()
    {
        //if (Experiment.Instance.CurrentProgress == Experiment.Progress.Begin)
        {
            if (GUILayout.Button("Load model"))
            {
                Debug.Log("Pressed!");
                var selectedFile = StandaloneFileBrowser.OpenFilePanel("Choose participant avatar", "", "fbx", false);

                if (selectedFile.Length > 0)
                {
                    var fileInfo = new FileInfo(selectedFile[0]);

                    if (fileInfo.Exists)
                    {
                        Experiment.Instance.LoadParticipantAvatar(fileInfo.FullName);
                    }
                }
            }
        }
    }
}
