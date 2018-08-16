using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using SFB;

public class VideoController : MonoBehaviour {

    public VideoPlayer player;

    public float[] Speeds =
        { 0.125f, 0.25f, 0.5f, 0.75f, 1.0f, 1.5f, 2.0f, 4.0f };

    public int speedIndex = 3;
    int defaultSpeedIndex;

    public bool playing = false;

    public bool enteredRoom = false;

    public float rewindTime = 5.0f;

    bool clipSelected = false;

    private void Start()
    {
        defaultSpeedIndex = speedIndex;
    }
    
    void LoadClipFromFile()
    {
        var clipFiles = StandaloneFileBrowser.OpenFilePanel("Choose video", Application.dataPath, 
            new []{ new ExtensionFilter("Video files", "mp4") }, false);

        if (clipFiles.Length > 0)
        {
            var clipFile = clipFiles[0];

            player.clip = null;
            player.url = clipFile;
        }
    }

    // Update is called once per frame
    void Update ()
    {
        if (player == null) return;

        if (playing)
        {
            // 2: slow down speed
            if (Input.GetKeyDown(KeyCode.Alpha2))
            {
                speedIndex = Mathf.Clamp(speedIndex - 1, 0, Speeds.Length - 1);
            }
            // 3: reset speed 
            if (Input.GetKeyDown(KeyCode.Alpha3))
            {
                speedIndex = defaultSpeedIndex;
            }
            // 4: increase speed
            if (Input.GetKeyDown(KeyCode.Alpha4))
            {
                speedIndex = Mathf.Clamp(speedIndex + 1, 0, Speeds.Length - 1);
            }

            float currentPlaybackSpeed = Speeds[speedIndex];

            if (player.playbackSpeed != currentPlaybackSpeed)
            {
                player.playbackSpeed = currentPlaybackSpeed;
            }
        }
        
    }
}
