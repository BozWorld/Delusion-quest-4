using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class TextlineUnwrapScript : MonoBehaviour
{
    TMP_Text _tmpText;
    string _txt;

    [SerializeField] float _delay = 0f;
    [SerializeField] float _speed = 0f;
    [SerializeField] string _leadingChar = "";
    [SerializeField] AudioClip _sfx;

    private void Start()
    {
        _tmpText = GetComponent<TMP_Text>()!;
    }

    public void UnwrapTextline(string txt)
    {
        StopAllCoroutines();

        if (_tmpText != null)
        {
            _txt = txt;

            _tmpText.text = "";
            StartCoroutine("Unwrapping");
        }
    }

    IEnumerator Unwrapping()
    {
        OtherManager.singleton.canAdvance = false;

        yield return new WaitForSeconds(_delay);

        foreach(char c in _txt)
        {
            if (_tmpText.text.Length > 0)
            {
                _tmpText.text = _tmpText.text.Substring(0, _tmpText.text.Length - _leadingChar.Length);
            }

            _tmpText.text += c;
            _tmpText.text += _leadingChar;

            if (_sfx != null)
            {
                //Play SFX
            }

            yield return new WaitForSeconds(_speed);
        }

        if (_leadingChar != "")
        {
            _tmpText.text = _tmpText.text.Substring(0, _tmpText.text.Length - _leadingChar.Length);
        }

        OtherManager.singleton.canAdvance = true;
    }
}
