using System.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class SkeletonVisibilityTracker : MonoBehaviour {

    [Serializable]
    public struct WorldScreen
    {
        public Transform tf;
        public Vector3 world;
        public Vector3 screen;
        public Vector3 clampedScreen;
        public bool visible;

        public static bool isVisible(Vector3 screen)
        {
            return screen.x >= 0.0f && screen.x <= 1.0f
                && screen.y >= 0.0f && screen.y <= 1.0f
                && screen.z >= 0.0f;
        }

        public void Update(Camera cam)
        {
            world = tf.position;
            screen = cam.WorldToViewportPoint(world);

            clampedScreen = new Vector3(
                Mathf.Clamp(screen.x, 0.0f, 1.0f),
                Mathf.Clamp(screen.y, 0.0f, 1.0f),
                screen.z);

            visible = isVisible(screen);
        }
    }
    public WorldScreen[] points = new WorldScreen[1];

    Dictionary<Transform, int> pointIndices = new Dictionary<Transform, int>();

    [Serializable]
    public class BoneVisibility
    {
        public Transform parent, child;
        public float boneLength = 0.0f;
        public float boneWeight = 0.0f;
        public bool visible = false;
    }

    public BoneVisibility[] bones = new BoneVisibility[1];

    public Transform rootJoint;
    public string[] stopAt = new string[] { "_finger", "_toe" };

    public Camera currentCam;

    public float totalBoneLength = 0f;

    public float percentSkeletonVisible = 0f;

    void Start ()
    {
        // Get all bones
        if (rootJoint)
        {
            //List<ScreenVisiblePoint> pl = new List<ScreenVisiblePoint>();
            List<WorldScreen> pointList = new List<WorldScreen>();
            List<BoneVisibility> boneVis = new List<BoneVisibility>();
            Queue<Transform> toAdd = new Queue<Transform>();
            toAdd.Enqueue(rootJoint);

            int tfIndex = 0;

            while(toAdd.Any())
            {
                Transform next = toAdd.Dequeue();
                WorldScreen ws = new WorldScreen
                {
                    tf = next
                };

                pointList.Add(ws);
                pointIndices[next] = tfIndex++;

                foreach(Transform child in next)
                {
                    bool shouldAdd = true;
                    foreach(string stop in stopAt)
                    {
                        if (child.name.ToLower().Contains(stop))
                        {
                            shouldAdd = false;
                            break;
                        }
                    }
                    if (shouldAdd)
                    {
                        float len = (child.position - next.position).magnitude;
                        BoneVisibility sp = new BoneVisibility
                        {
                            parent = next,
                            child = child,
                            boneLength = len
                        };

                        totalBoneLength += len;

                        boneVis.Add(sp);

                        toAdd.Enqueue(child);
                    }
                }
            }

            points = pointList.ToArray();
            bones = boneVis.ToArray();
            
            foreach(var bone in bones)
            {
                bone.boneWeight = bone.boneLength / totalBoneLength;
            }

            Debug.Log(string.Format("Initialized skeleton visibility on {0} with {1} joints, {2} bones.",
                gameObject.name, points.Length, bones.Length));
        }
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		for(int i = 0; i < points.Length; i++)
        {
            points[i].Update(currentCam);
        }

        percentSkeletonVisible = 0f;

        for(int i = 0; i < bones.Length; i++)
        {
            int pi = pointIndices[bones[i].parent];
            int ci = pointIndices[bones[i].child];
            bones[i].visible = points[pi].visible && points[ci].visible;

            if (bones[i].visible)
            {
                percentSkeletonVisible += bones[i].boneWeight;
            }
        }
	}

    void OnDrawGizmos()
    {
        //if (tfPoints == null || bones == null) return;

        foreach (var p in points)
        {
            if (p.visible)
            {
                Gizmos.color = Color.green;
            }
            else
            {
                Gizmos.color = Color.red;
            }
            Gizmos.DrawSphere(p.world, 0.025f);
        }

        foreach(var b in bones)
        {
            if (b.visible)
            {
                Gizmos.color = Color.green;
            }
            else
            {
                Gizmos.color = Color.red;
            }
            Vector3 from = points[pointIndices[b.parent]].world;
            Vector3 to = points[pointIndices[b.child]].world;
            Gizmos.DrawLine(from, to);
        }
    }
}
