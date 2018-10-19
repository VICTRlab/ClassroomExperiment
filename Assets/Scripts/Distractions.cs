using System;
using System.IO;
using System.Collections.Generic;
using UnityEngine;

public class Distractions : MonoBehaviour
{
    public static Distractions Instance;

    public enum Distraction
    {
        None,
        HumanAudio,
        HumanVisual, 
        TechAudio,
        TechVisual,
        StartVideo,
        StopVideo,
        Mirror,
        Reset
    }

    //public static Dictionary<string, > typemap = new dictionary<string, distractiontype>
    //{
    //    { "phone", distractiontype.phone },
    //    { "stretch", distractiontype.stretch }
    //};

    public static readonly Dictionary<string, Distraction> distractionMap = new Dictionary<string, Distraction>
    {
        { "phone", Distraction.TechAudio },
        { "stretch", Distraction.HumanVisual },
        { "cough", Distraction.HumanAudio },
        { "laptop", Distraction.TechVisual }
    };

    public class DistractionEvent
    {
        /// <summary>
        /// When the event should occur relative to the start of the video playback
        /// </summary>
        public TimeSpan runAt = TimeSpan.Zero;
        /// <summary>
        /// Which distraction agent to use
        /// </summary>
        public int index = 0;
        public Distraction distraction = Distraction.None;
    }

    public List<DistractionEvent> distractionEvents = new List<DistractionEvent>();

    public int distractionIndex = 0;

    public DistractionAgent[] Agents;

    public Vector2 Frequency = new Vector2(1.0f, 10.0f);

    bool hasBegun = false;
    public DateTime distractionsBeganAt;

    private void Awake()
    {
        Instance = this;
    }

    public void PrepareDistractions()
    {
        if (ExperimentConfig.Instance.eventsFromFile)
        {
            LoadFromFile(ExperimentConfig.Instance.eventCues);
        }
        else
        {
            Autogenerate(Experiment.Instance.projectorController.player.clip.length);
        }
    }

    public void LoadFromFile(string filename)
    {
        var fi = new FileInfo(filename);
        if (!fi.Exists)
        {
            Debug.LogError("Error: file does not exist." + fi.FullName);
            return;
        }

        distractionEvents.Clear();
        using (var fin = fi.OpenText())
        {
            var contents = fin.ReadToEnd().Split(new char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

            foreach(var d in contents)
            {
                var c = d.Split(new char[] { ' ', '\t' }, StringSplitOptions.RemoveEmptyEntries);

                if (c.Length != 3)
                {
                    Debug.LogError("Unable to parse distration entry: " + d);
                    continue;
                }
                var timestamp = c[0];
                var index = c[1];
                var type = c[2];

                DistractionEvent de = new DistractionEvent
                {
                    runAt = TimeSpan.Parse(timestamp),
                    index = int.Parse(index),
                    distraction = distractionMap[type]
                };

                Debug.Log(string.Format("Adding distraction event: {0}, {1}, {2}",
                    de.runAt.ToString(), de.index, de.distraction.ToString()));

                distractionEvents.Add(de);
            }
        }
    }

    /// <summary>
    /// Generates distraction events to occur for the length of the video clip
    /// </summary>
    /// <param name="clipLength">Length of clip in seconds</param>
    public void Autogenerate(double clipLength)
    {
        distractionEvents.Clear();
        double t = UnityEngine.Random.Range(Frequency.x, Frequency.y);
        while (t < clipLength)
        {
            DistractionEvent de = new DistractionEvent
            {
                runAt = TimeSpan.FromSeconds(t),
                index = UnityEngine.Random.Range(0, Agents.Length),
                distraction = (Distraction)UnityEngine.Random.Range(1, 5)
            };
            distractionEvents.Add(de);
            t += UnityEngine.Random.Range(Frequency.x, Frequency.y);
        }
    }

    void Distract(DistractionEvent de)
    {
        float dl = Agents[de.index].Distract(de);
        Experiment.Instance.SendSignal(de.distraction.ToString()
            + " distraction from " + Agents[de.index].name, dl, de.distraction);
    }
	
	// Update is called once per frame
	void Update ()
    {
		if (Experiment.Instance.CurrentProgress == Experiment.Progress.VideoStarted && !hasBegun)
        {
            hasBegun = true;
            distractionsBeganAt = DateTime.Now;
        }

        if (hasBegun && Experiment.Instance.CurrentProgress != Experiment.Progress.End)
        {
            TimeSpan diff = DateTime.Now - distractionsBeganAt;

            if (distractionIndex < distractionEvents.Count 
                && diff >= distractionEvents[distractionIndex].runAt)
            {
                Distract(distractionEvents[distractionIndex]);
                distractionIndex++;
            }
        }
	}
}
