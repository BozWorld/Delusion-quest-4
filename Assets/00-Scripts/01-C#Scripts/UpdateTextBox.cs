using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UpdateTextBox : MonoBehaviour
{
    [SerializeField] TextlineUnwrapScript txt;

    private void Start()
    {
        transform.localScale = new Vector3(1, 0, 1);
        txt.GetComponent<TextlineUnwrapScript>();
    }

    public void UpdateText(string content)
    {
        if (transform.localScale != Vector3.one) LeanTween.scaleY(gameObject, 1, 0.2f);
        txt.UnwrapTextline(content);
    }

    public void UpdateText(string target,string content)
    {
        txt.UnwrapTextline(content);
    }
}
