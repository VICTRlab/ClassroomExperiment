using UnityEngine;
using System.Collections;

public class HeadTilt : MonoBehaviour {

	[SerializeField] float neckLength;

	float pitch { get { return transform.localRotation.eulerAngles.x; } }
	float yaw { get { return transform.localRotation.eulerAngles.y; } }
	float roll { get { return transform.localRotation.eulerAngles.z; } }
    Transform neck;

    [SerializeField] [Range(-30, 20)] float neckBend;


	void Start () {
        Transform[] bones = transform.parent.parent.Find("Sam_Avatar/CC_Base_Body").GetComponent<SkinnedMeshRenderer>().bones;
        //for (int i = 0; i < bones.Length; i++)
        //    print(bones[i].name + "  " + i.ToString());

        neck = bones[8];
	}
	
	void Update () {

        neck.localRotation = Quaternion.Euler(Vector3.forward * neckBend);

		float z = neckLength * Mathf.Sin(pitch * Mathf.Deg2Rad);
		float y = neckLength * Mathf.Cos(pitch * Mathf.Deg2Rad);
		transform.localPosition = new Vector3 (transform.localPosition.x, y, z);
	}
}