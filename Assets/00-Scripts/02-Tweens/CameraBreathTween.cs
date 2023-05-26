using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraBreathTween : MonoBehaviour
{

    public void Breath()
    {
        LeanTween.rotateX(gameObject, -0.5f, 1.5f).

            setLoopPingPong(-1);
    }

    public void Stop()
    {
        LeanTween.rotateX(gameObject, 0, 0.3f);
    }
    
}
