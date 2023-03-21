using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UpdateTextBox : MonoBehaviour
{
    [SerializeField] TextlineUnwrapScript txt;

    private void Start()
    {

        txt.GetComponent<TextlineUnwrapScript>();
    }

    public void UpdateText(string content)
    {
        txt.UnwrapTextline(content);
    }

    public void UpdateText(string target,string content)
    {
        txt.UnwrapTextline(content);
    }
}
