using UnityEngine;
using System.Collections;

public class MoviePlayerScript : MonoBehaviour {

    public GameObject moviePlayer;
    public AudioClip movieAudio;
    public float coolDown = 4f; // Cooldown when pass through door and play movie
    bool played = false;
    bool collided = false;

    Renderer r;
    MovieTexture movie;
    AudioSource movieAudioSource;

	// Use this for initialization
	void Start () {

        r = moviePlayer.GetComponent<Renderer>();
        movie = (MovieTexture)r.material.mainTexture;
        movieAudioSource = this.GetComponent<AudioSource>();
        movieAudioSource.clip = movieAudio;
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
            movieAudioSource.Play();
            played = true;
            coolDown = 99999999f; // Cheat to make it super long to cool down again.
        }

        if (Input.GetKeyDown("5"))
        {
            if (played)
            {
                movie.Pause();
                movieAudioSource.Pause();
                played = !played;
            }
            else
            {
                movie.Play();
                movieAudioSource.Play();
                played = !played;
            }

        }

    }

    void OnTriggerEnter(Collider col)
    {
        collided = true;

    }
}
