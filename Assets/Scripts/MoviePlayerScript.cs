using UnityEngine;
using System.Collections;

public class MoviePlayerScript : MonoBehaviour {

	// Use this for initialization
	void Start () {

        Renderer r = GetComponent<Renderer>();
        MovieTexture movie = (MovieTexture)r.material.mainTexture;

        movie.Play();
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
