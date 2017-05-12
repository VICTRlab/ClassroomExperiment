using UnityEngine;
using System.Collections;

public class HeadTilt : MonoBehaviour {

	[SerializeField] float neckLength;

	float pitch { get { return transform.localRotation.eulerAngles.x; } }
	float yaw { get { return transform.localRotation.eulerAngles.y; } }
	float roll { get { return transform.localRotation.eulerAngles.z; } }


	void Start () {
	
	}
	
	void Update () {
		float z = neckLength * Mathf.Sin(pitch * Mathf.Deg2Rad);
		float y = neckLength * Mathf.Cos(pitch * Mathf.Deg2Rad);
		transform.localPosition = new Vector3 (transform.localPosition.x, y, z);
	}
}