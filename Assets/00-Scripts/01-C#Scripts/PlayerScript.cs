using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerScript : MonoBehaviour
{
    [SerializeField] GameObject _cmdPanel;
    [SerializeField] BulletHandlerScript _bulletPanel;

    public void EnableCommands()
    {
        InkManager.singleton.canAdvance = false;
        _cmdPanel.SetActive(true);

    }

    public void SetBulletPanel(string color)
    {
        _bulletPanel.SetColor(color);
    }

    public void SetBulletPanel(int pwr)
    {
        _bulletPanel.SetSize(pwr);
    }
    
}
