using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ActionPanelBrain : MonoBehaviour
{
    [SerializeField] GameObject _actionTxt;
    [SerializeField]List<RectTransform> _baseButtons;
    [SerializeField] Image _bullet;
    [SerializeField] Color red, blue,violet,yellow;
    [SerializeField] List<Image> _hp;
    [SerializeField] public TextlineUnwrapScript _clr, _pwr;

    private void Start()
    {
        foreach(RectTransform img in _baseButtons)
        {
            img.localScale = Vector3.zero;
            _actionTxt.SetActive(false);
        }
    }

    public void EnableBaseActionsPanel()
    {
        foreach(RectTransform img in _baseButtons)
        {
            LeanTween.scale(img, Vector3.one, 0.3f);
        }
        _actionTxt.SetActive(true);
    }

    public void DisableBaseActionsPanel()
    {
        foreach(RectTransform img in _baseButtons)
        {
            LeanTween.scale(img, Vector3.zero, 0.3f);
        }
        _actionTxt.SetActive(false);
    }

    public void DischargeBullet()
    {
        LeanTween.scale(_bullet.gameObject, new Vector3(30, 30, 1), 1f);
        LeanTween.alpha(_bullet.rectTransform, 0, 1f).setOnComplete(() =>
        {
            _bullet.rectTransform.localScale = Vector3.zero;
            _bullet.color = Color.white;
        });
    }

    public void SetBulletSize(int pwr)
    {
        switch (pwr)
        {
            case 0:
                LeanTween.scale(_bullet.gameObject, Vector3.zero, .3f);
                break;
            case 1:
                LeanTween.scale(_bullet.gameObject, Vector3.one, .3f);
                LeanTween.scaleY(_pwr.gameObject, 1, 0.3f);
                _pwr.UnwrapTextline("Bientot full...");
                break;
            case 2:
                LeanTween.scale(_bullet.gameObject, new Vector3(2,2,2), .3f);
                LeanTween.scaleY(_pwr.gameObject, 1, 0.3f);
                _pwr.UnwrapTextline("C'est full, Go! Go!");
                break;
        }
    }

    public void SetBulletColor(string color)
    {
        switch (color)
        {
            case "red":
                LeanTween.scaleY(_clr.gameObject, 1, 0.3f);
                _clr.UnwrapTextline("red up");
                _bullet.color = red;
                break;
            case "blue":
                LeanTween.scaleY(_clr.gameObject, 1, 0.3f);
                _clr.UnwrapTextline("blue up");
                _bullet.color = blue;
                break;
            case "violet":
                LeanTween.scaleY(_clr.gameObject, 1, 0.3f);
                _clr.UnwrapTextline("violet here");
                _bullet.color = violet;
                break;
            case "empty":
                _bullet.color = Color.white;
                LeanTween.scaleY(_clr.gameObject, 1, 0.3f);
                _clr.UnwrapTextline("clear");
                break;

        }
    }

    public void SetHP(int hp)
    {
        switch (hp)
        {
            case 0:
                _hp[0].color = Color.white;
                _hp[1].color = Color.white;
                _hp[2].color = Color.white;
                _hp[3].color = Color.white;
                break;

            case 1:
                _hp[0].color = yellow;
                _hp[1].color = Color.white;
                _hp[2].color = Color.white;
                _hp[3].color = Color.white;
                break;

            case 2:
                _hp[0].color = yellow;
                _hp[1].color = yellow;
                _hp[2].color = Color.white;
                _hp[3].color = Color.white;
                break;

            case 3:
                _hp[0].color = yellow;
                _hp[1].color = yellow;
                _hp[2].color = yellow;
                _hp[3].color = Color.white;
                break;

            case 4:
                _hp[0].color = yellow;
                _hp[1].color = yellow;
                _hp[2].color = yellow;
                _hp[3].color = yellow;
                break;

            
        }
    }
}
