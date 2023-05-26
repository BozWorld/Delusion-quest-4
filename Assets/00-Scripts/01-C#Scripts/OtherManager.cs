using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class OtherManager : MonoBehaviour
{
    public static OtherManager singleton;
    public Camera main;
    CameraBreathTween breath;

    public Story story;
    [SerializeField] TextAsset _json;
    [SerializeField] string path;
    [SerializeField] GameObject _playerBox, _enemyBox;
    [SerializeField] TextlineUnwrapScript _playerTxt, _enemyTxt,_foregroundTxt;

    public bool canAdvance;
    [SerializeField] ForegroundTween _foreground;
    [SerializeField] ActionPanelBrain _actionPanel;

    private void Awake()
    {
        if (singleton != null && singleton == this) Destroy(this);
        else { singleton = this; }
    }


    // Start is called before the first frame update
    void Start()
    {
        story = new Story(_json.text);
        story.ChoosePathString(path);

        story.ObserveVariable("bulletPWR", (string varName, object newValue) =>
        {
            int pwr = int.Parse(newValue.ToString());
            _actionPanel.SetBulletSize(pwr);
        });
        story.ObserveVariable("bulletCLR", (string varName, object newValue) =>
        {
            _actionPanel.SetBulletColor(newValue.ToString());
        });
        story.ObserveVariable("playerHP", (string varName, object newValue) =>
        {
            int hp = int.Parse(newValue.ToString());
            _actionPanel.SetHP(hp);
        });
        story.BindExternalFunction("DelusionShift", (string name) =>
        {
            _actionPanel.DischargeBullet();
            _foreground.DisplayDelusionShift();
        });

       

        breath = main.GetComponent<CameraBreathTween>();
        LeanTween.scaleY(_actionPanel._clr.gameObject, 0, 0.3f);
        LeanTween.scaleY(_actionPanel._pwr.gameObject, 0, 0.3f);
        canAdvance = true;
        ActionPanelInputs.singleton.enabled = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            AdvanceStory();
            
        }
    }
    public void AdvanceStory()
    {
        LeanTween.scaleY(_actionPanel._clr.gameObject, 0, 0.3f);
        LeanTween.scaleY(_actionPanel._pwr.gameObject, 0, 0.3f);
        if (story.canContinue==true && canAdvance == true)
        {
            story.Continue();
            if (ChoiceNeeded()) DisplayChoices();

            if (story.currentText.Contains("_"))
            {
                DisplayDialogue(story.currentText);
            }
            else
            {
                DisplayNarrative(story.currentText);
            }
        }
    }

    bool ChoiceNeeded()
    {
        if (story.currentChoices.Count > 0)
        {
            return true;
        }

        return false;
    }

    void DisplayDialogue(string txt)
    {
        breath.Breath();
        _foreground.ToggleForeground(true);

        string[] splits = story.currentText.Split('_');
        string speaker = splits[0].Trim();
        string content = splits[1].Trim();

        switch (speaker)
        {
            case "p":
                LeanTween.scaleY(_enemyBox, 0, 0.3f);
                LeanTween.scaleY(_playerBox, 1, .3f);
                LeanTween.rotateY(main.gameObject, -1, 0.3f);
                _playerTxt.UnwrapTextline(content);
                break;

            case "e":
                LeanTween.scaleY(_playerBox, 0, .3f);
                LeanTween.scaleY(_enemyBox, 1, .3f);
                LeanTween.rotateY(main.gameObject, 1, 0.3f);
                _enemyTxt.UnwrapTextline(content);
                break;

            case "b":
                if (!txt.Contains('$')) Debug.LogError("t'as oublié le $");
                LeanTween.rotateY(main.gameObject, 0, 0.3f);
                LeanTween.scaleY(_playerBox, 1, .3f);
                LeanTween.scaleY(_enemyBox, 1, .3f);
                string[] lines = content.Split('$');
                string playerLine = lines[0];
                string enemyLine = lines[1];
                _playerTxt.UnwrapTextline(playerLine);
                _enemyTxt.UnwrapTextline(enemyLine);
                break;
        }
    }

    void DisplayNarrative(string txt)
    {
        breath.Stop();
        _foreground.ToggleForeground(false);
        LeanTween.rotateY(main.gameObject, 0, 0.3f);
        _foregroundTxt.UnwrapTextline(txt);
    }

    void DisplayChoices()
    {
        ActionPanelInputs.singleton.enabled = true;
        _actionPanel.EnableBaseActionsPanel();
    }

    public void SelectChoice(int choice)
    {
        if (canAdvance == false) return;
        LeanTween.scaleY(_playerBox, 0, .3f);
        LeanTween.scaleY(_enemyBox, 0, .3f);
        story.ChooseChoiceIndex(choice);
        ActionPanelInputs.singleton.enabled = false;
        _actionPanel.DisableBaseActionsPanel();
        //_actionPanel.SetActive(false);


        AdvanceStory();
    }
}
