using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(OtherManager))]
public class ActionPanelInputs : MonoBehaviour
{
    public static ActionPanelInputs singleton;

    public KeyCode Abutton = KeyCode.A;
    public KeyCode Bbutton = KeyCode.Z;
    public KeyCode Cbutton = KeyCode.E;
    public KeyCode Dbutton = KeyCode.R;

    public OtherManager brain;

    private void Awake()
    {
        if (singleton != null && singleton == this) Destroy(this);
        else { singleton = this;}

        brain = GetComponent<OtherManager>();
    }

    private void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(Abutton)) OtherManager.singleton.SelectChoice(0);
        if (Input.GetKeyDown(Bbutton)) OtherManager.singleton.SelectChoice(1);
        if (Input.GetKeyDown(Cbutton)) OtherManager.singleton.SelectChoice(2);
        if (Input.GetKeyDown(Dbutton)) OtherManager.singleton.SelectChoice(3);
    }
}
