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
    public Material wikitext, wikitext2;
    bool standardProjector = true;
    int projectorSlide = 0;

	// Use this for initialization
	void Start () {

        UIPortrait = UIPortraitObject.GetComponent<Image>();
        
        // Turn off all child renderer from StandardAvatar's childrens
        foreach (Renderer r in StandardAvatar.GetComponentsInChildren<Renderer>())
            r.enabled = false;

        ProjectorDisplay = Projector.GetComponent<MeshRenderer>();

    }
	
	// Update is called once per frame
	void Update () {

        if (Input.GetKeyDown("1"))
        {
            switchPortrait(standardPort);
            standardPort = !standardPort;
        }

        if (Input.GetKeyDown("2"))
        {
            switchAvatar(standardAvat);
            standardAvat = !standardAvat;
        }

        if (Input.GetKeyDown("3"))
        {
            switchProjector(standardProjector);
            standardProjector = !standardProjector;
        }

        if (Input.GetKeyDown("q"))
        {
            changeProjectorSlide(projectorSlide, false);
        }

        if (Input.GetKeyDown("e"))
        {
            changeProjectorSlide(projectorSlide, true);
        }
	}

    void changeProjectorSlide(int slide, bool right)
    {
        if (right)
        {
            slide++;
            ProjectorDisplay.material = wikitext2;
        }
        else
        {
            slide--;
            ProjectorDisplay.material = wikitext;
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
        if (standardProjector)
            ProjectorDisplay.material = wikitext;
        else
            ProjectorDisplay.material = movie;
    }
}
