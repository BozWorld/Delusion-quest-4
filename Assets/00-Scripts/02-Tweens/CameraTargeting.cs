using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraTargeting : MonoBehaviour
{
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Z)) LeanTween.rotateY(gameObject, -1, .3f);
        if (Input.GetKeyDown(KeyCode.E)) LeanTween.rotateY(gameObject, 0, .3f);
        if (Input.GetKeyDown(KeyCode.R)) LeanTween.rotateY(gameObject, 1, .3f);
    }
}
