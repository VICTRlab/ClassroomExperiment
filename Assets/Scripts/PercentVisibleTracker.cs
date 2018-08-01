 using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PercentVisibleTracker : MonoBehaviour {

    public class ScreenVisiblePoint
    {
        public Vector3 world = Vector3.zero;
        public Vector3 screen = Vector3.zero;
        public Vector3 clampedScreen = Vector3.zero;
        public bool visible = false;

        public static bool isVisible(Vector3 screen)
        {
            return screen.x >= 0.0f && screen.x <= 1.0f
                && screen.y >= 0.0f && screen.y <= 1.0f
                && screen.z >= 0.0f;
        }

        public void update(Camera cam)
        {
            screen = cam.WorldToViewportPoint(world);

            clampedScreen = new Vector3(
                Mathf.Clamp(screen.x, 0.0f, 1.0f),
                Mathf.Clamp(screen.y, 0.0f, 1.0f),
                screen.z);
            
            visible = isVisible(screen);
        }
    }

    public ScreenVisiblePoint[] points;

    public MeshFilter mesh;

    public Camera camera;

    public float percentVisible = 0.0f;

    public float lookScore = 0.0f;

    bool initialized = false;

    public int rowCount = 20;
    public int colCount = 20;

    Vector3[] testVectors;
	
	// Update is called once per frame
	void Update () {

        if (!initialized)
        {
            testVectors = new Vector3[rowCount * colCount];
            points = new ScreenVisiblePoint[mesh.mesh.vertices.Length];

            for (int i = 0; i < points.Length; i++)
            {
                points[i] = new ScreenVisiblePoint();
                points[i].world = mesh.transform.TransformPoint(mesh.mesh.vertices[i]);
            }
            
            initialized = true;
        }

        int numVisible = 0;
        for (int i = 0; i < points.Length; i++)
        {
            points[i].update(camera);
            if (points[i].visible)
            {
                numVisible++;
            }
        }

        if (numVisible == points.Length)
        {
            percentVisible = 1.0f;
        }
        else if (numVisible == 0)
        {
            percentVisible = 0.0f;
        }
        else
        {


            // Need to compute the actual amount of screen visible using the viewport coordinates
            // The quad points are in this order:
            //  2 -------- 1
            //    |      |
            //  0 -------- 3

            Vector3 lowerLeft = points[0].world;
            Vector3 right = (points[3].world - lowerLeft);
            Vector3 up = (points[2].world - lowerLeft);

            float colWidth = right.magnitude / colCount;
            float rowHeight = up.magnitude / rowCount;

            

            right = right.normalized * colWidth;
            up = up.normalized * rowHeight;


            int subVisible = 0;
            int k = 0;
            for (int i = 0; i < rowCount; i++)
            {
                Vector3 rx = right * (float)i;
                for(int j = 0; j < colCount; j++)
                {
                    Vector3 cy = up * (float)j;

                    Vector3 p = lowerLeft + rx + cy;
                    Vector3 s = camera.WorldToViewportPoint(p);
                    bool visible = ScreenVisiblePoint.isVisible(s);

                    if (visible)
                    {
                        subVisible++;
                    }

                    testVectors[k++] = p;
                }
            }

            percentVisible = (float)subVisible / (rowCount * colCount);

            //Vector3 topDiff = points[1].screen - points[2].screen;
            //Vector3 botDiff = points[3].screen - points[0].screen;
            //Vector3 leftDiff = points[2].screen - points[0].screen;
            //Vector3 rightDiff = points[1].screen - points[3].screen;

            //float fullArea = ((topDiff + botDiff) * 0.5f).magnitude * ((leftDiff + rightDiff) * 0.5f).magnitude;

            //topDiff = points[1].clampedScreen - points[2].clampedScreen;
            //botDiff = points[3].clampedScreen - points[0].clampedScreen;
            //leftDiff = points[2].clampedScreen - points[0].clampedScreen;
            //rightDiff = points[1].clampedScreen - points[3].clampedScreen;

            //float clampedArea = ((topDiff + botDiff) * 0.5f).magnitude * ((leftDiff + rightDiff) * 0.5f).magnitude;

            //percentVisible = clampedArea / fullArea;
        }

        // Compute look score: compare the camera forward direction with the 
        // camera position to center of screen vector

        Vector3 camForward = camera.transform.forward;

        Vector3 screenForward = (mesh.transform.position - camera.transform.position).normalized;

        float angle = Vector3.Angle(camForward, screenForward);

        if (angle <= 90.0f)
        {
            lookScore = 1.0f - angle / 90.0f;
        }
        else
        {
            lookScore = (90.0f - angle) / 90.0f;
        }

        //Debug.Log(pointLog);

        //percentVisible = (float)numVisible / points.Length;
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.yellow;
        for (int i = 0; i < points.Length; i++)
        {
            Gizmos.DrawSphere(points[i].world, 0.5f);
        }

        Gizmos.color = Color.green;
        foreach (Vector3 v in testVectors)
        {
            Gizmos.DrawSphere(v, 0.1f);
        }
    }
}
