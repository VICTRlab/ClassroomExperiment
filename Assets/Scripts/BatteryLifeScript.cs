using UnityEngine;
using System.Collections;

public class BatteryLifeScript : MonoBehaviour {

    GameObject BatteryLifeImage;
    float charge = 10; // Random initial number. Range should be 2 - 20.

	// Use this for initialization
	void Start () {
        BatteryLifeImage = this.gameObject;
	}
	
	// Update is called once per frame
	void Update () {

        charge = Random.Range(9f, 11f); // smaller range right now
        gameObject.transform.localScale = new Vector3(charge / 20, gameObject.transform.localScale.y, gameObject.transform.localScale.z);

	}
}
