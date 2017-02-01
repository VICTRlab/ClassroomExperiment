﻿using UnityEngine;
using System.Collections;

public class HeartBeatScript : MonoBehaviour {

    GameObject HeartImage;
    public float beatsPerMin = 90; // Default is 90bpm.
    float beatTime = 0.666666667f; // Default is 90bpm, so 90 beats / 60 seconds = 1.5 beats per sec, or 0.6666667sec per beat
    Vector3 originalImageScale;

	// Use this for initialization
	void Start () {
        HeartImage = this.gameObject;
        originalImageScale = this.transform.localScale;
        SetBPMtoBeatTime(beatsPerMin);

	}
	
	// Update is called once per frame
	void Update () {

        beatTime -= Time.deltaTime;
        HeartImage.transform.localScale = Vector3.Lerp(originalImageScale/1.5f, originalImageScale, beatTime);
        if ( beatTime < 0)
        {
            HeartImage.transform.localScale = originalImageScale;
            SetBPMtoBeatTime(beatsPerMin);
        }

	}

    void SetBPMtoBeatTime(float num)
    {
        beatTime = (1 / (beatsPerMin / 60));
    }
}
