using System.Collections;
using System.Collections.Generic;
using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
[CustomEditor(typeof(DoorControl))]
public class DoorControlEditor : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        var dc = (DoorControl)target;

        if (GUILayout.Button("Set opened pose"))
        {
            dc.SetPose(true);
        }
        if (GUILayout.Button("Set closed pose"))
        {
            dc.SetPose(false);
        }

        if (GUILayout.Button("Toggle door"))
        {
            dc.Toggle();
        }
    }
}
#endif

public class DoorControl : MonoBehaviour {

    public bool Opened = true;

    [System.Serializable]
    public class TF
    {
        public Vector3 position;
        public Quaternion rotation;
    }

    public TF OpenedPose = new TF();
    public TF ClosedPose = new TF();

    public void SetPose(bool opened)
    {
        var tf = opened ? OpenedPose : ClosedPose;

        tf.position = transform.position;
        tf.rotation = transform.rotation;
    }

	public void Toggle()
    {
        var tf = Opened ? ClosedPose : OpenedPose;
        Opened = !Opened;

        transform.position = tf.position;
        transform.rotation = tf.rotation;
    }
}
