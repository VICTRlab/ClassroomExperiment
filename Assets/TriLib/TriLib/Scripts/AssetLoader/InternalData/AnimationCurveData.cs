using UnityEngine;
using System.Collections.Generic;

namespace TriLib
{
    /// <summary>
    /// Internally represents an Unity <see cref="UnityEngine.AnimationCurve"/>.
    /// </summary>
    public class AnimationCurveData
    {
        //public readonly Keyframe[] Keyframes;
        public readonly List<Keyframe> Keyframes = new List<Keyframe>();

        public AnimationCurveData() { }

        public AnimationCurveData(uint numKeys)
        {
            Keyframes = new List<Keyframe>((int)numKeys);
        }

        public void AddKey(float time, float value)
        {
            Keyframes.Add(new Keyframe(time, value));
        }

        public AnimationCurve AnimationCurve;
    }
}