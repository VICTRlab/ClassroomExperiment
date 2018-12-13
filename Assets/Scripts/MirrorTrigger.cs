using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MirrorTrigger : MonoBehaviour
{
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    float enteredAt = 0f;
    float timeAtMirror = 0f;

    private void OnTriggerEnter(Collider other)
    {
        enteredAt = Time.time;
        Experiment.Instance.SendSignal("Entered mirror space", 0.0f, Distractions.Distraction.Mirror);
    }

    private void OnTriggerExit(Collider other)
    {
        timeAtMirror = Time.time - enteredAt;
        Experiment.Instance.SendSignal("Exited mirror space in " + timeAtMirror.ToString() + " seconds", 
            0.0f, Distractions.Distraction.None);
    }
}
