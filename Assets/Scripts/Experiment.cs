using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Experiment : MonoBehaviour {

    public static Experiment Instance;

    public enum Progress
    {
        Begin,
        SelectMode,
        SelectAvatar,
        InClassroom,
        Seated,
        End
    }

    public Progress CurrentProgress = Progress.Begin;

    public GameObject participantAvatar;

	// Use this for initialization
	void Start () {
        Instance = this;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void LoadParticipantAvatar(string fbxPath)
    {
        using (var assetLoader = new TriLib.AssetLoader())
        {
            try
            {
                var loaderOptions = new TriLib.AssetLoaderOptions();
                loaderOptions.DontLoadCameras = true;
                loaderOptions.DontLoadLights = true;
                participantAvatar = assetLoader.LoadFromFile(fbxPath, loaderOptions);
            }
            catch(Exception ex)
            {
                Debug.LogError(ex.ToString());
            }
        }
    }
}
