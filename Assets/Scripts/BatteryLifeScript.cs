using UnityEngine;
using System.Collections;

public class BatteryLifeScript : MonoBehaviour {

    GameObject BatteryLifeImage;
    float charge = 10; // Random initial number. Range should be 2 - 20.
    float updateTime = 2f; // Time until the parameters change (just for simulation)

	// Use this for initialization
	void Start () {
        BatteryLifeImage = this.gameObject;

        // This is to initialize the randomness at start so it doesn't start at 100%
        charge = Random.Range(9f, 11f); // smaller range right now
        gameObject.transform.localScale = new Vector3(charge / 20, gameObject.transform.localScale.y, gameObject.transform.localScale.z);
    }
	
	// Update is called once per frame
	void Update () {

        updateTime -= Time.deltaTime;
        if (updateTime <= 0)
        {
            charge = Random.Range(9f, 11f); // smaller range right now
            gameObject.transform.localScale = new Vector3(charge / 20, gameObject.transform.localScale.y, gameObject.transform.localScale.z);
            updateTime = 2f;
        }
	}
}
