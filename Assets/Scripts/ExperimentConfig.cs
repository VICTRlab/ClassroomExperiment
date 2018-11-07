using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using SFB;

public class ExperimentConfig : MonoBehaviour {

    private static bool created = false;
    public static ExperimentConfig Instance;

    /// <summary>
    /// Video clip to be used for experiment. Saved in history file
    /// </summary>
    public string videoFile;
    /// <summary>
    /// File containing distraction cues. Saved in history file
    /// </summary>
    public string eventCues;
    /// <summary>
    /// Whether to load event cues from a file or compute them
    /// </summary>
    public bool eventsFromFile;
    /// <summary>
    /// Parent directory where experiment data is saved. Saved in history file
    /// </summary>
    public string dataFolder;
    /// <summary>
    /// The avatar file to be loaded for the participant
    /// </summary>
    public string sessionAvatar;
    /// <summary>
    /// Name of this session
    /// </summary>
    public string sessionName = "Participant";

    public bool readyToStart = false;
    public bool experimentStarted = false;

    List<string> errors = new List<string>();

    readonly string historyFilename = "last_config.txt";

    public enum InterfaceMode
    {
        Desktop,
        VR
    }

    public InterfaceMode interfaceMode;

    public int selectedToolbar = 0;
    public string[] toolbarNames = { "Experiment", "Serial" };

    public string serialSend;

    private void RefreshConfig(bool isLoad = true)
    {
        FileInfo fi = new FileInfo(historyFilename);

        // Create file if it doesn't exist and save defaults
        if (!fi.Exists)
        {
            var fin = fi.CreateText();
            fin.Close();
            RefreshConfig(false);
            return;
        }

        if (isLoad)
        {
            using (var fin = fi.OpenText())
            {
                videoFile = fin.ReadLine();
                eventCues = fin.ReadLine();
                eventsFromFile = bool.Parse(fin.ReadLine());
                dataFolder = fin.ReadLine();
            }
        }
        else
        {
            using (var fout = fi.OpenWrite())
            using (var txtOut = new StreamWriter(fout))
            {
                txtOut.WriteLine(videoFile);
                txtOut.WriteLine(eventCues);
                txtOut.WriteLine(eventsFromFile.ToString());
                txtOut.WriteLine(dataFolder);
            }
        }
    }

    private void Awake()
    {
        if (!created)
        {
            DontDestroyOnLoad(gameObject);
            created = true;
            Instance = this;
            RefreshConfig();
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
		if (readyToStart && !experimentStarted)
        {
            errors.Clear();

            bool stillReady = true;
            // Check that things are valid before beginning experiment
            if (string.IsNullOrEmpty(videoFile))
            {
                stillReady = false;
                errors.Add("Video file not selected");
            }

            if (eventsFromFile && string.IsNullOrEmpty(eventCues))
            {
                stillReady = false;
                errors.Add("Set to load events from file, but file not selected");
            }

            if (string.IsNullOrEmpty(dataFolder))
            {
                stillReady = false;
                errors.Add("Data folder not selected");
            }

            if (string.IsNullOrEmpty(sessionAvatar))
            {
                stillReady = false;
                errors.Add("Session avatar not selected");
            }

            if (string.IsNullOrEmpty(sessionName))
            {
                stillReady = false;
                errors.Add("Session name not selected");
            }

            if (stillReady)
            {
                experimentStarted = true;
                RefreshConfig(false);
                StartCoroutine(StartExperiment());
            }
            else
            {
                readyToStart = false;
            }   
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

    string ChooseFolder(string label, string dir)
    {
        var selectedFolder = StandaloneFileBrowser.OpenFolderPanel(label, dir, false);
        if (selectedFolder.Length > 0)
        {
            var folderInfo = new DirectoryInfo(selectedFolder[0]);

            if (!folderInfo.Exists)
            {
                folderInfo.Create();
            }
            return folderInfo.FullName;
        }
        return string.Empty;
    }

    private void OnGUI()
    {
        if (experimentStarted) return;

        Rect guiRect = new Rect(Screen.width * 0.4f, Screen.height * 0.2f, 100f, 40f);
        Rect menuRect = new Rect(guiRect);
        menuRect.width = Screen.width * 0.4f;
        selectedToolbar = GUI.Toolbar(menuRect, selectedToolbar, toolbarNames);
        guiRect.y += 50f;

        if (selectedToolbar == 0)
        {
            if (GUI.Button(guiRect, "Video clip"))
            {
                videoFile = LoadFile("Choose video clip", "", "mp4");
            }

            if (!string.IsNullOrEmpty(videoFile))
            {
                Rect labelRect = new Rect(guiRect);
                labelRect.x += 150f;
                labelRect.width = 400f;
                GUI.Label(labelRect, videoFile);
            }
            guiRect.y += 50f;

            eventsFromFile = GUI.Toggle(guiRect, eventsFromFile, "Load events?");
            guiRect.y += 50f;

            if (eventsFromFile)
            {
                if (GUI.Button(guiRect, "Event cues"))
                {
                    eventCues = LoadFile("Choose event cues file", "", "txt");
                }

                if (!string.IsNullOrEmpty(eventCues))
                {
                    Rect labelRect = new Rect(guiRect);
                    labelRect.x += 150f;
                    labelRect.width = 400f;
                    GUI.Label(labelRect, eventCues);
                }
                guiRect.y += 50f;
            }


            if (GUI.Button(guiRect, "Data folder"))
            {
                dataFolder = ChooseFolder("Data folder", "");
            }

            if (!string.IsNullOrEmpty(dataFolder))
            {
                Rect labelRect = new Rect(guiRect);
                labelRect.x += 150f;
                labelRect.width = 400f;
                GUI.Label(labelRect, dataFolder);
            }
            guiRect.y += 50f;

            if (GUI.Button(guiRect, "Session avatar"))
            {
                sessionAvatar = LoadFile("Choose session avatar", "", "fbx");
            }

            if (!string.IsNullOrEmpty(sessionAvatar))
            {
                Rect labelRect = new Rect(guiRect);
                labelRect.x += 150f;
                labelRect.width = 400f;
                GUI.Label(labelRect, sessionAvatar);
            }
            guiRect.y += 50f;

            GUI.Label(guiRect, "Session name");
            var nameRect = new Rect(guiRect);
            nameRect.x += 150f;
            nameRect.width = 200f;
            sessionName = GUI.TextField(nameRect, sessionName);
            guiRect.y += 50f;



            GUI.Label(guiRect, "Interface");
            var interfaceRect = new Rect(guiRect);
            interfaceRect.x += 150f;
            interfaceRect.width = 200f;
            string interfaceStr = interfaceMode.ToString();
            if (GUI.Button(interfaceRect, interfaceStr))
            {
                interfaceMode = (InterfaceMode)(1 - (int)interfaceMode);
            }
            guiRect.y += 50f;

            if (GUI.Button(guiRect, "Start"))
            {
                readyToStart = true;
            }

            var quitRect = new Rect(guiRect);
            quitRect.x += 150f;
            if (GUI.Button(quitRect, "Quit"))
            {
                Application.Quit();
            }
            guiRect.y += 50f;

            if (errors.Count > 0)
            {
                //guiRect.x = 0.2f * Screen.width;
                guiRect.width = Mathf.Max(Screen.width - guiRect.x - 20, 300f);
                guiRect.height = Mathf.Max(Screen.height - guiRect.y - 20f, 300f);
                string total = "Errors!\n" + string.Join("\n", errors.ToArray());

                var oldCol = GUI.contentColor;
                GUI.contentColor = Color.yellow;
                GUI.Label(guiRect, total);
                GUI.contentColor = oldCol;
            }
        }
        else if (selectedToolbar == 1)
        {
            var sc = Serial.GetConfig();

            guiRect.width = 400f;

            var nameRect = new Rect(guiRect);
            GUI.Label(nameRect, "Port name");

            nameRect.x += 150f;
            sc.portName = GUI.TextField(nameRect, sc.portName);
            guiRect.y += 50f;

            var speedRect = new Rect(guiRect);
            GUI.Label(speedRect, "Speed");
            speedRect.x += 150f;
            string speedStr = GUI.TextField(speedRect, sc.speed.ToString());
            if (speedStr != sc.speed.ToString())
            {
                int newSpeed = sc.speed;
                if (int.TryParse(speedStr, out newSpeed))
                {
                    sc.speed = newSpeed;
                }
            }
            guiRect.y += 50f;

            int parityInt = (int)sc.parity;

            Rect parityRect = new Rect(guiRect);
            GUI.Label(parityRect, "Parity");
            parityRect.x += 150f;
            parityInt = GUI.Toolbar(parityRect, parityInt, System.Enum.GetNames(typeof(System.IO.Ports.Parity)));
            sc.parity = (System.IO.Ports.Parity)parityInt;
            guiRect.y += 50f;

            Rect bitsRect = new Rect(guiRect);
            GUI.Label(bitsRect, "Data bits");
            bitsRect.x += 150f;
            bitsRect.width -= 150f;
            string dataBitsStr = GUI.TextField(bitsRect, sc.dataBits.ToString());
            if (dataBitsStr != sc.dataBits.ToString())
            {
                int newDB = sc.dataBits;
                if (int.TryParse(dataBitsStr, out newDB))
                {
                    sc.dataBits = newDB;
                }
            }
            guiRect.y += 50f;

            Rect stopRect = new Rect(guiRect);
            GUI.Label(stopRect, "Stop bits");
            int stopBit = (int)sc.stopBits;
            stopRect.x += 150f;
            stopBit = GUI.Toolbar(stopRect, stopBit, System.Enum.GetNames(typeof(System.IO.Ports.StopBits)));
            sc.stopBits = (System.IO.Ports.StopBits)stopBit;
            guiRect.y += 50f;

            Rect ioRect = new Rect(guiRect);
            ioRect.width = 150f;
            if (GUI.Button(ioRect, "Close port"))
            {
                Serial.ClosePort();
            }
            ioRect.x += 150f;
            if (GUI.Button(ioRect, "Open port"))
            {
                Serial.checkOpen();
            }
            ioRect.x += 150f;
            GUI.Label(ioRect, "Status: " + (Serial.IsOpen ? "Open" : "Closed"));
            guiRect.y += 50f;

            guiRect.width = 150f;
            GUI.Label(guiRect, "Test string");
            guiRect.x += 150f;

            serialSend = GUI.TextField(guiRect, serialSend);
            guiRect.x += 150f;
            if (GUI.Button(guiRect, "Send"))
            {
                Serial.Write(serialSend);
            }
        }
    }
}
