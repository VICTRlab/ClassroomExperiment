using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using UnityEngine.VR;
using System.Collections;

public class MainMenuScript : MonoBehaviour {

    bool mode2d = true;
    public Button ConfirmButton;

	// Use this for initialization
	void Start () {
	    
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    public void changeText()
    {
        if(mode2d)
        {
            this.GetComponentInChildren<Text>().text = "3D Mode";
            VRSettings.LoadDeviceByName("Oculus");
            mode2d = !mode2d;
        }
        else
        {
            this.GetComponentInChildren<Text>().text = "2D Mode";
            VRSettings.LoadDeviceByName("");
            mode2d = !mode2d;
        }
        ConfirmButton.GetComponentInChildren<Image>().color = Color.white;
        ConfirmButton.GetComponentInChildren<Text>().text = "Confirm Mode";
    }

    public void confirm()
    {
        if(!mode2d)
            VRSettings.enabled = true;
        else
            VRSettings.enabled = false;
        ConfirmButton.GetComponentInChildren<Image>().color = Color.yellow;
        ConfirmButton.GetComponentInChildren<Text>().text = "Confirmed";
    }

    public void startGame()
    {
        SceneManager.LoadScene("Experiment Class", LoadSceneMode.Additive);
    }
}
