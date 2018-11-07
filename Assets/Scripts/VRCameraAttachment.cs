using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VRCameraAttachment : MonoBehaviour
{
    public static VRCameraAttachment Instance;
    /// <summary>
    /// The target anchor point for the VR camera
    /// </summary>
    public Transform AttachTo;

    /// <summary>
    /// The necessary manufactured evil child of AttachTo and parent of VRCamera. 
    /// Exists solely to apply the VR Camera's local transform in reverse so it can
    /// be centered at the anchor point
    /// </summary>
    public Transform Counterweight;

    /// <summary>
    /// The actual VR Camera
    /// </summary>
    public Transform VRCamera;

    public Transform LookTarget;

    public bool LookAtTarget = false;

    public float LookRange = 20f;

    public float LookAtTheTime = 0f;

    public float LookDuration = 1f;

    public Quaternion InitialCounterweightRot;

    public bool attached = false;

    public UnityStandardAssets.Characters.FirstPerson.FirstPersonController FPS;

    public struct TransformOffset
    {
        public Vector3 position;
        public Quaternion rotation;
    }

    TransformOffset offset;

    bool buttonState = false, lastButtonState = false;


    public void Attach(Transform tf)
    {
        if (tf == null) return;
        AttachTo = tf;

        Counterweight.parent = AttachTo;

        Counterweight.position = Vector3.zero;
        Counterweight.rotation = Quaternion.identity;

        
        //VRCamera.parent = Counterweight;


        //Resync();
    }

    // We want to compute a transform that will transform the camera position to the
    // AttachTo transform (negate the camera's local transform and rotation)
    void Resync()
    {
        Vector3 lookDir = VRCamera.transform.forward;
        lookDir.y = 0.0f;
        lookDir.Normalize();

        if (FPS != null)
        {
            FPS.transform.rotation = Quaternion.LookRotation(lookDir);
        }

        if (!attached && AttachTo != null)
        {
            Attach(AttachTo);
            attached = true;
            //FPS.lookVREnabled = true;
        }

        //offset.position = -VRCamera.localPosition;
        //offset.rotation = Quaternion.Inverse(VRCamera.localRotation);
        if (Counterweight)
        {
            AttachTo.localRotation = Quaternion.identity;

            // Compute the difference in orientation between the headset 
            var vrlq = VRCamera.localRotation;
            var vrle = vrlq.eulerAngles;
            vrle.x = 0.0f;
            //vrle.y = 0.0f;
            vrle.z = 0.0f;
            //vrle.z = 0.0f;
            var rvrlq = Quaternion.Euler(vrle);
            Quaternion invQ = Quaternion.Inverse(rvrlq);

            // We want the camera to view straight forward from the avatar, so to do this properly, we need
            // to reset the attachment's default local rotation (

            Counterweight.localRotation = invQ;
            Counterweight.localPosition = Counterweight.localRotation * -(VRCamera.localPosition);

        }
    }

    public void AttachPlayerCamera(Transform tf)
    {
        if (tf && VRCamera)
        {
            Attach(tf);
        }
    }

    private void Start()
    {
        Instance = this;
    }

    // Update is called once per frame
    void Update()
    {
        // Compute the transforms between the VR headset and the attachment
        if (Input.GetButtonDown("XboxB"))
        {
            Resync();
        }

        //lastButtonState = buttonState;
        //buttonState = VRContext.Left.input.direction.pressed;

        //if (buttonState && !lastButtonState)
        //{
        //    LookAtTarget = !LookAtTarget;
        //    LookAtTheTime = Time.time;

        //    if (LookAtTarget)
        //    {
        //        InitialCounterweightRot = Counterweight.transform.rotation;
        //        Resync();
        //    }
        //}

        //var t = Mathf.Clamp01(Time.time - LookAtTheTime) / LookDuration;
        //if (LookAtTarget)
        //{
        //    var targetRot = Quaternion.LookRotation((LookTarget.transform.position - transform.position).normalized, transform.up);

        //    if (t < 1f)
        //    {
        //        Counterweight.transform.rotation = Quaternion.Slerp(InitialCounterweightRot, targetRot, t);
        //    }
        //    else
        //    {
        //        Counterweight.transform.rotation = targetRot;
        //    }

        //}
    }
}