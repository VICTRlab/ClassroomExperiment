using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArrowPulse : MonoBehaviour {

    public float Period = 5.0f;
    public Vector3 Displacement = new Vector3(0.0f, 0.5f, 0.0f);
    Vector3 initial;

    float t = 0.0f;
    float direction = 1.0f;

	// Use this for initialization
	void Start () {
        initial = transform.position;
	}
	
	// Update is called once per frame
	void Update () {
        t += Time.deltaTime;

        if (t >= Period)
        {
            t = 0.0f;
            direction *= -1.0f;
        }

        float ts = Mathf.Sin((t / Period) * Mathf.PI * 2.0f);

        transform.position = initial + (ts * Displacement);
	}
}
