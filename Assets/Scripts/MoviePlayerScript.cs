﻿using UnityEngine;
using System.Collections;

public class MoviePlayerScript : MonoBehaviour {

    public GameObject moviePlayer;
    public float coolDown = 4f; // Cooldown when pass through door and play movie
    bool played = false;
    bool collided = false;

    Renderer r;
    MovieTexture movie;

	// Use this for initialization
	void Start () {

        r = moviePlayer.GetComponent<Renderer>();
        movie = (MovieTexture)r.material.mainTexture;

        if (Input.GetKeyDown("5"))
        {
            if(played)
            {
                movie.Pause();
                played = !played;
            }
            else
            {
                movie.Play();
                played = !played;
            }
            
        }

    }
	
	// Update is called once per frame
	void Update () {

        if (collided)
        {
            coolDown -= Time.deltaTime;
        }
        if (coolDown <= 0 && played == false)
        {
            movie.Play();
            played = true;
        }

	}

    void OnTriggerEnter(Collider col)
    {
        collided = true;

    }
}
