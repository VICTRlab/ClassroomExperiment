using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using UnityEngine.VR;
using System.Collections;

public class MainMenuScript : MonoBehaviour {

    bool mode2d = true;
    public Button ConfirmButton;


    // Button press to change 2D <-> 3D. It also cancelled the confirmation button's color
    public void changeText() {
        if(mode2d) {
            this.GetComponentInChildren<Text>().text = "3D Mode";
            UnityEngine.XR.XRSettings.LoadDeviceByName("Oculus");
        } else {
            this.GetComponentInChildren<Text>().text = "2D Mode";
            UnityEngine.XR.XRSettings.LoadDeviceByName("");
        }
		mode2d = !mode2d;
		ConfirmButton.GetComponentInChildren<Image>().color = Color.white;
        ConfirmButton.GetComponentInChildren<Text>().text = "Confirm Mode";
    }

    // Do NOT move the VRSettings.enabled to the same as the changeText() button; for some reason in this version of Unity, VRSettings must be enabled at least ONE frame after LoadDeviceByName is ran.
    // This button must be pressed before Start begins, or else it will just run 2D mode.
    public void confirm() {
		UnityEngine.XR.XRSettings.enabled = !mode2d;
        ConfirmButton.GetComponentInChildren<Image>().color = Color.yellow;
        ConfirmButton.GetComponentInChildren<Text>().text = "Confirmed";
    }

    // Start game button press
    public void startGame() {
		SceneManager.LoadScene("Experiment Class");
    }
}
