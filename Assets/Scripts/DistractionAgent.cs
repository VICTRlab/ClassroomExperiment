using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
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

    public VideoPlayer techVideo;

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

        // Get tech video to first frame
        if (techVideo)
        {
            techVideo.Prepare();
            techVideo.Play();
            techVideo.Pause();
            techVideo.frame = 1;

            //StartCoroutine(PrepVideo());

            techVideo.loopPointReached += (src) =>
            {
                techVideo.Play();
                techVideo.Pause();
                techVideo.frame = 1;
                Debug.Log("Loop point reached");
                //StartCoroutine(PrepVideo());
            };
        }

        //stretchGraph = PlayableGraph.Create();
        //stretchGraph.SetTimeUpdateMode(DirectorUpdateMode.GameTime);
        //stretchOutput = AnimationPlayableOutput.Create(stretchGraph, "Stretch", humanAnimator);
        //stretchPlayable = AnimationClipPlayable.Create(stretchGraph, stretchClip);
        //stretchOutput.SetSourcePlayable(stretchPlayable);

        //coughGraph = PlayableGraph.Create();
        //coughOutput = AnimationPlayableOutput.Create(coughGraph, "Cough", humanAnimator);
        //coughPlayable = AnimationClipPlayable.Create(coughGraph, coughClip);
        //coughOutput.SetSourcePlayable(coughPlayable);
    }

    IEnumerator PrepVideo()
    {
        Debug.Log("Prepping distraction video");
        techVideo.Stop();

        techVideo.frameReady += TechVideo_frameReady;

        techVideo.Play();
        yield return null;
    }

    bool gotDatFrame = false;

    private void TechVideo_frameReady(VideoPlayer source, long frameIdx)
    {
        if (frameIdx >= 1)
        {
            techVideo.frameReady -= TechVideo_frameReady;
            techVideo.Pause();
            Debug.Log("First frame ready");
        }
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
                techVideo.Stop();
                techVideo.Play();
                length = (float)techVideo.clip.length;
                break;
            case Distractions.Distraction.None:
            default:
                break;
        }

        return length;
    }
}
