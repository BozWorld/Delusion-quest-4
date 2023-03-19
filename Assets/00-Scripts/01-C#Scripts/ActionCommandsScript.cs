using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActionCommandsScript : MonoBehaviour
{
    KeyCode Abutton = KeyCode.A;
    KeyCode Bbutton = KeyCode.Z;
    KeyCode Cbutton = KeyCode.E;
    KeyCode Dbutton = KeyCode.R;

    private void Update()
    {
        if (Input.GetKeyDown(Abutton)) InputAction(0);
        if (Input.GetKeyDown(Bbutton)) InputAction(1);
        if (Input.GetKeyDown(Cbutton)) InputAction(2);
        if (Input.GetKeyDown(Dbutton)) InputAction(3);
    }

    void InputAction(int index)
    {
        InkManager.singleton.story.ChooseChoiceIndex(index);
        InkManager.singleton.canAdvance = true;
        InkManager.singleton.AdvanceStory();
        gameObject.SetActive(false);
    }
}    
