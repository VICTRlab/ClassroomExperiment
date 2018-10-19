using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Animations;

public class DistractionAgent : MonoBehaviour {

    public AudioSource source;

    public AudioClip humanAudio;
    public AudioClip techAudio;

    public AnimationClip stretchClip;
    public AnimationClip coughClip;
    //public string techVisual;

    public Animator humanAnimator;

    // Use this for initialization
    void Start () {
        if (!source)
        {
            source = GetComponent<AudioSource>();
        }
        if (!humanAnimator)
        {
            humanAnimator = GetComponent<Animator>();
        }

        //stretchGraph = PlayableGraph.Create();
        //stretchGraph.SetTimeUpdateMode(DirectorUpdateMode.GameTime);
        //stretchOutput = AnimationPlayableOutput.Create(stretchGraph, "Stretch", humanAnimator);
        //stretchPlayable = AnimationClipPlayable.Create(stretchGraph, stretchClip);        //stretchOutput.SetSourcePlayable(stretchPlayable);

        //coughGraph = PlayableGraph.Create();
        //coughOutput = AnimationPlayableOutput.Create(coughGraph, "Cough", humanAnimator);
        //coughPlayable = AnimationClipPlayable.Create(coughGraph, coughClip);        //coughOutput.SetSourcePlayable(coughPlayable);
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public float Distract(Distractions.DistractionEvent de)
    {
        float length = 0.0f;
        switch (de.distraction)
        {
            case Distractions.Distraction.HumanAudio:
                source.clip = humanAudio;
                source.Play();
                //coughPlayable.Play();
                length = coughClip.length;
                humanAnimator.Play("Cough", -1, 0f);
                break;
            case Distractions.Distraction.HumanVisual:
                humanAnimator.Play("Stretch", -1, 0f);
                length = stretchClip.length;
                break;
            case Distractions.Distraction.TechAudio:
                source.clip = techAudio;
                source.Play();
                length = techAudio.length;
                break;
            case Distractions.Distraction.TechVisual:
                length = 3.0f;
                break;
            case Distractions.Distraction.None:
            case Distractions.Distraction.Count:
            default:
                break;
        }

        return length;
    }
}
