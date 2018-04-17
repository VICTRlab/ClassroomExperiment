using UnityEngine;
using System.Collections;
using UnityEngine.UI;

// This script is used to control behavior in the scene; currently you can toggle the portrait, avatar model, and video/text on the projector screen.

public class SceneControllerManagerScript : MonoBehaviour {

    public GameObject UIPortraitObject;
    Image UIPortrait;
    public Sprite standardPortrait;
    public Sprite personalizedPortrait;
    bool standardPort = true;

    public GameObject StandardAvatar;
    public GameObject PersonalizedAvatar;
    bool standardAvat = true;

    public GameObject Projector;
    MeshRenderer ProjectorDisplay;
    public Material movie;
    public Material[] slides;
    bool standardProjector = true;
    int projectorSlide = 1; // Slide starts as 1. I already added prevention in case no slides are added.

	// Use this for initialization
	void Start () {

        UIPortrait = UIPortraitObject.GetComponent<Image>();
        
        if (StandardAvatar != null)
        {
            // Turn off all child renderer from StandardAvatar's childrens
            foreach (Renderer r in StandardAvatar.GetComponentsInChildren<Renderer>())
                r.enabled = false;
        }
        
        ProjectorDisplay = Projector.GetComponent<MeshRenderer>();
    }
	
	// Update is called once per frame
	void Update () {

        //// Switches the portrait on the UI
        //if (Input.GetKeyDown("1"))
        //{
        //    switchPortrait(standardPort);
        //    standardPort = !standardPort;
        //}

        //// Switches the avatar
        //if (Input.GetKeyDown("2"))
        //{
        //    switchAvatar(standardAvat);
        //    standardAvat = !standardAvat;
        //}

        //// Switches the projector between movie and slides
        //if (Input.GetKeyDown("3"))
        //{
        //    switchProjector(standardProjector);
        //    standardProjector = !standardProjector;
        //}

        //// Go back one slide
        //if (Input.GetKeyDown("q"))
        //{
        //    changeProjectorSlide(false);
        //}

        //// Go forward one slide
        //if (Input.GetKeyDown("e"))
        //{
        //    changeProjectorSlide(true);
        //}
	}

    void changeProjectorSlide(bool right)
    {
        if (right && ((projectorSlide != slides.Length && (projectorSlide != 0))))
        {
            projectorSlide++;
            ProjectorDisplay.material = slides[projectorSlide-1];
        }
        if (!right && ((projectorSlide != 1) && (projectorSlide != 0)))
        {
            projectorSlide--;
            ProjectorDisplay.material = slides[projectorSlide-1];
        }
    }

    void switchPortrait(bool standardPort)
    {
        if (standardPort)
            UIPortrait.sprite = standardPortrait;
        else
            UIPortrait.sprite = personalizedPortrait;
    }

    void switchAvatar(bool standardAvat)
    {
        if (standardAvat)
        {
            foreach (Renderer r in StandardAvatar.GetComponentsInChildren<Renderer>())
                r.enabled = true;
            foreach (Renderer r in PersonalizedAvatar.GetComponentsInChildren<Renderer>())
                r.enabled = false;
        }
        else
        {
            foreach (Renderer r in StandardAvatar.GetComponentsInChildren<Renderer>())
                r.enabled = false;
            foreach (Renderer r in PersonalizedAvatar.GetComponentsInChildren<Renderer>())
                r.enabled = true;
        }
    }

    void switchProjector(bool standardProjector)
    {
        if (standardProjector && ((projectorSlide != 1) && (projectorSlide != 0)))
            ProjectorDisplay.material = slides[projectorSlide-1];
        else
            ProjectorDisplay.material = movie;
    }
}
