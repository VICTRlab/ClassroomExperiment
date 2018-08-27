using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Distractions : MonoBehaviour {

    public static Distractions Instance;

    public AudioSource[] sources;

    public Vector2 Frequency = new Vector2(1.0f, 10.0f);

    float lastPlayed = 0.0f;
    float untilNext = 0.0f;

    bool hasBegun = false;

    private void Awake()
    {
        Instance = this;
    }

    // Use this for initialization
    void Start () {
		
	}

    void Distract()
    {
        lastPlayed = Time.time;
        int sourceIndex = Random.Range(0, sources.Length);

        sources[sourceIndex].Play();
        untilNext = Random.Range(Frequency.x, Frequency.y);

        Experiment.Instance.SendSignal("Distraction from " + sources[sourceIndex].name);
    }
	
	// Update is called once per frame
	void Update () {
		if (Experiment.Instance.CurrentProgress == Experiment.Progress.VideoStarted && !hasBegun)
        {
            hasBegun = true;

            untilNext = Random.Range(Frequency.x, Frequency.y);
            lastPlayed = Time.time;
        }

        if (Experiment.Instance.CurrentProgress != Experiment.Progress.End && hasBegun)
        {
            float currentTime = Time.time;

            if (currentTime - lastPlayed > untilNext)
            {
                Distract();
            }
        }
	}
}
