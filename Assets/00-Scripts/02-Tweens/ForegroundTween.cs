using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ForegroundTween : MonoBehaviour
{
    [SerializeField] RectTransform imgA, imgB, imgDS;
    
    //bool _opened = false;
    float _duration=.3f;

    // Start is called before the first frame update
    void Start()
    {
        imgA.anchoredPosition = new Vector2(0, 120);
        imgB.anchoredPosition = new Vector2(0, -165);
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void ToggleForeground(bool opn)
    {
        if (opn == true)
        {
            LeanTween.move(imgA, new Vector2(0, 120) , _duration);
            LeanTween.move(imgB, new Vector2(0, -165), _duration);
        }
        else
        {
            LeanTween.move(imgA, Vector2.zero, _duration);
            LeanTween.move(imgB, Vector2.zero,_duration);
        }
    }

    public void DisplayDelusionShift()
    {
        LeanTween.scaleY(imgDS.gameObject, 1, 0.3f).setDelay(1.5f);
        LeanTween.scaleY(imgDS.gameObject, 0, 0.3f).setDelay(3f)
            .setOnComplete(() =>
            {
                OtherManager.singleton.AdvanceStory();
            });
    }
}
