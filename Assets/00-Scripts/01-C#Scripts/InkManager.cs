using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class InkManager : MonoBehaviour
{
    public static InkManager singleton;

    public Story story;
    [SerializeField] TextAsset _inkJson;

    [SerializeField] PlayerScript _playerScript;
    [SerializeField] GameObject _mainTxtBox;
    [SerializeField] GameObject _protaTxtBox;
    [SerializeField] GameObject _enemyTxtBox;

    public bool canAdvance;
    GameObject currentTarget;
    [SerializeField] TMP_Text _HPtxt;
    private void Awake()
    {
        if(singleton != null && singleton == this)
        {
            Destroy(this);
        }
        else { singleton = this; }
    }

    void InitStory()
    {
        // Init story var
        story = new Story(_inkJson.text);
        canAdvance = true;

        // Bind EXTERNAL functions

        // Set Observable VAR
        story.ObserveVariable("bulletPWR", (string varName, object newValue) =>
        {
            int pwr = int.Parse(newValue.ToString()); //là j'ai un int
            _playerScript.SetBulletPanel(pwr);
        });
        story.ObserveVariable("bulletCLR", (string varName, object newValue) =>
        {
            string color = newValue.ToString(); //là j'ai la color
            _playerScript.SetBulletPanel(color);
        });
        story.ObserveVariable("HP", (string varName, object newValue) =>
        {
            _HPtxt.text = "HP " + newValue.ToString();
        });
    }

    private void Start()
    {
        InitStory();
        currentTarget = _protaTxtBox;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space)) AdvanceStory();
    }

    public void AdvanceStory()
    {
        if (story.canContinue == true && canAdvance == true)
        {
            story.Continue();

            if(story.currentChoices.Count > 0)
            {
                _playerScript.EnableCommands();
                
            }

            if (!story.currentText.Contains("_"))
            {
                LeanTween.scaleY(_enemyTxtBox, 0, 0.2f);
                LeanTween.scaleY(_protaTxtBox, 0, 0.2f);
                _mainTxtBox.GetComponent<UpdateTextBox>().UpdateText(story.currentText);
                return;
            }
            
            string[] textlineSplits = story.currentText.Split('_');
            string target = textlineSplits[0].Trim();
            string content = textlineSplits[1].Trim();

            
            DisplayDialogue(target,content);
        }
    }

    void DisplayDialogue(string target,string content)
    {
        switch (target)
        {
            case "b":
                BothSpeaking(content);
                break;

            case "p":
                if (currentTarget != _protaTxtBox) LeanTween.scaleY(_enemyTxtBox, 0, 0.2f);
                currentTarget = _protaTxtBox;
                _protaTxtBox.GetComponent<UpdateTextBox>().UpdateText(content);
                break;

            case "e":
                if (currentTarget != _enemyTxtBox) LeanTween.scaleY(_protaTxtBox, 0, 0.2f);
                currentTarget = _enemyTxtBox;
                _enemyTxtBox.GetComponent<UpdateTextBox>().UpdateText( content);
                break;

            default:break;
        }
    }

    void BothSpeaking(string txt)
    {
        if (!txt.Contains("$")) Debug.LogError("no non non moeva c pas comme ça");
        string[] textlineSplits = txt.Split('$');
        string player = textlineSplits[0].Trim();
        string enemy = textlineSplits[1].Trim();
        _protaTxtBox.GetComponent<UpdateTextBox>().UpdateText(player);
        _enemyTxtBox.GetComponent<UpdateTextBox>().UpdateText(enemy);
    }
}
