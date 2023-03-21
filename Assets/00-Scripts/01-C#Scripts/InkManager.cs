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
        AdvanceStory();
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

            if (!story.currentText.Contains("_"))Debug.LogError("text line is not appropriate - underscore '_' missing");

            string[] textlineSplits = story.currentText.Split('_');
            string target = textlineSplits[0].Trim();
            string content = textlineSplits[1].Trim();

            DisplayTextline(target,content);
        }
    }

    void DisplayTextline(string target,string content)
    {
        switch (target)
        {
            case "n":
                _mainTxtBox.GetComponent<UpdateTextBox>().UpdateText(content);
                break;

            case "p":
                _protaTxtBox.GetComponent<UpdateTextBox>().UpdateText(target,content);
                break;

            case "e":
                _enemyTxtBox.GetComponent<UpdateTextBox>().UpdateText(target, content);
                break;

            default:break;
        }
    }
}
