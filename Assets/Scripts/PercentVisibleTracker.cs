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

    public Camera currentCam;

    public float percentVisible = 0.0f;

    public float lookScore = 0.0f;

    //bool initialized = false;

    public int rowCount = 20;
    public int colCount = 20;

    public class TestPoint
    {
        public Vector3 point;
        public bool visible = false;
    }
    public int testPointsVisible = 0;
    TestPoint[] testPoints;

    void recomputeVisibility()
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


        testPointsVisible = 0;
        int k = 0;
        for (int i = 0; i < rowCount; i++)
        {
            Vector3 rx = right * (float)i;
            for (int j = 0; j < colCount; j++)
            {
                Vector3 cy = up * (float)j;

                Vector3 p = lowerLeft + rx + cy;
                Vector3 s = currentCam.WorldToViewportPoint(p);
                bool visible = ScreenVisiblePoint.isVisible(s);

                if (visible)
                {
                    testPointsVisible++;
                }

                testPoints[k].point = p;
                testPoints[k].visible = visible;

                k++;
            }
        }
    }

    private void Start()
    {
        testPoints = new TestPoint[rowCount * colCount];

        for (int i = 0; i < testPoints.Length; i++)
        {
            testPoints[i] = new TestPoint();
        }

        points = new ScreenVisiblePoint[mesh.mesh.vertices.Length];

        for (int i = 0; i < points.Length; i++)
        {
            points[i] = new ScreenVisiblePoint();
            points[i].world = mesh.transform.TransformPoint(mesh.mesh.vertices[i]);
        }
    }

    // Update is called once per frame
    void Update () {

        //if (!initialized)
        //{

            
        //    initialized = true;
        //}

        Vector3 camForward = currentCam.transform.forward;

        Vector3 screenForward = (mesh.transform.position - currentCam.transform.position).normalized;

        float angle = Vector3.Angle(camForward, screenForward);

        if (angle <= 90.0f)
        {
            lookScore = 1.0f - angle / 90.0f;
        }
        else
        {
            lookScore = (90.0f - angle) / 90.0f;
        }


        int numVisible = 0;
        for (int i = 0; i < points.Length; i++)
        {
            points[i].update(currentCam);
            if (points[i].visible)
            {
                numVisible++;
            }
        }

        recomputeVisibility();

        if (numVisible == points.Length)
        {
            percentVisible = 1.0f;
        }
        else
        { 
            percentVisible = (float)testPointsVisible / (rowCount * colCount);

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



        //Debug.Log(pointLog);

        //percentVisible = (float)numVisible / points.Length;
    }

    void OnDrawGizmos()
    {
        if (points == null || testPoints == null) return;

        Gizmos.color = Color.yellow;
        for (int i = 0; i < points.Length; i++)
        {
            Gizmos.DrawSphere(points[i].world, 0.2f);
        }

        foreach (TestPoint p in testPoints)
        {
            if (p.visible)
            {
                Gizmos.color = Color.green;
            }
            else
            {
                Gizmos.color = Color.red;
            }
            Gizmos.DrawSphere(p.point, 0.1f);
        }
    }
}
