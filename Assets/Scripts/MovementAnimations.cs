using UnityEngine;
using UnityEngine.VR;
using System.Collections;

public class MovementAnimations : MonoBehaviour {

	[SerializeField] float neckLength;

	float pitch { get { return transform.localRotation.eulerAngles.x; } }
	float yaw { get { return transform.localRotation.eulerAngles.y; } }
	float roll { get { return transform.localRotation.eulerAngles.z; } }
    Transform[] bones;
    public Transform neck;

    [SerializeField] float swayAmplitude;
    [SerializeField] float swayPeriod;

    Quaternion leftShoulderRelaxed;
    Quaternion rightShoulderRelaxed;

	void Start () {
        //bones = transform.parent.parent.Find("Sam_Avatar/CC_Base_Body").GetComponent<SkinnedMeshRenderer>().bones;

//        for (int i = 0; i < bones.Length; i++)
//            print(bones[i].name + "  " + i.ToString());

        //neck = bones[8];

        //leftShoulderRelaxed = bones[41].localRotation;
        //rightShoulderRelaxed = bones[74].localRotation;
	}
	
	void Update () {
        return;
        // SHOULDERS (CLAVICLE) ARE INDEXED AT 41 AND 74
        // THIS DOESN'T WORK YET BECAUSE CURRENT AVATAR DOES NOT HAVE HANDS AT SIDE
        if (transform.parent.parent.GetComponent<CharacterController>().velocity.sqrMagnitude > 0) {
            Vector3 rot = bones[74].localRotation.eulerAngles;
            bones[74].localRotation = Quaternion.Euler(new Vector3(Mathf.Sin(Time.time / swayPeriod) * swayAmplitude, rot.y, rot.z));
            rot = bones[41].localRotation.eulerAngles;
            bones[41].localRotation = Quaternion.Euler(new Vector3(Mathf.Sin(Time.time / swayPeriod) * swayAmplitude, rot.y, rot.z));
        } else {
            bones[41].localRotation = leftShoulderRelaxed;
            bones[74].localRotation = rightShoulderRelaxed;
        }

        Quaternion headRot = UnityEngine.XR.InputTracking.GetLocalRotation(UnityEngine.XR.XRNode.Head);
        neck.localRotation = headRot;

        //if (!UnityEngine.XR.XRSettings.enabled)  {
        //    float z = neckLength * Mathf.Sin(pitch * Mathf.Deg2Rad);
        //    float y = neckLength * Mathf.Cos(pitch * Mathf.Deg2Rad);
        //    transform.localPosition = new Vector3(transform.localPosition.x, y, z);
        //    neck.localRotation = transform.localRotation;
        //} else {

        //    // SHREYA PLEASE TEST ALL OF THIS

        //    // Get current headset rotation and set mesh's neck's rotation to match
        //    Quaternion headRot = UnityEngine.XR.InputTracking.GetLocalRotation(UnityEngine.XR.XRNode.Head);
        //    neck.localRotation = headRot;

        //    // Recenter the camera when they press center button on Oculus Remote
        //    if (Input.GetKeyDown(KeyCode.JoystickButton0)) {
        //        UnityEngine.XR.InputTracking.Recenter();
        //    }
        //}



    }
}