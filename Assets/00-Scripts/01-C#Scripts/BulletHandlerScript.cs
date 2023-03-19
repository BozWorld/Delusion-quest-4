using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BulletHandlerScript : MonoBehaviour
{
    [SerializeField] GameObject _bullet;
    RectTransform _bulletTransform;
    Image _bulletImg;
    [SerializeField] Color violet;
    void Start()
    {
        _bulletTransform = _bullet.GetComponent<RectTransform>();
        _bulletImg = _bullet.GetComponent<Image>();
    }

    public void SetSize(int pwr)
    {
        switch (pwr)
        {
            case 0:
                LeanTween.scale(_bulletTransform, Vector3.zero, 0.3f);
                break;
            case 1:
                LeanTween.scale(_bulletTransform, new Vector3(.5f, .5f,.5f), .3f);
                break;
            case 2:
                LeanTween.scale(_bulletTransform, Vector3.one, .3f);
                break;
        }
    }

    public void SetColor(string color)
    {
        switch (color)
        {
            case "red":
                _bulletImg.color = Color.red;
                break;
            case "blue":
                _bulletImg.color = Color.blue;
                break;
            case "violet":
                _bulletImg.color = violet;
                break;
        }
    }
}
