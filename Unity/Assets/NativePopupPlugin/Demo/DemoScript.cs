using UnityEngine;
using NativePopup;

public class DemoScript : MonoBehaviour
{
    public void Start()
    {
        NativeMessage.GetInstance().Initialize(true);
    }
    public void OpenAlertOne()
    {
        Debug.Log("open alert with one button");
        NativeMessage.GetInstance().ShowAlertOneButton("Alert", "This is alert", "OK", response =>
        {
            Debug.Log($"alert callback: {response}");
        });
    }

    public void OpenAlertTwo()
    {
        Debug.Log("open alert with two button");
        NativeMessage.GetInstance().ShowAlertTwoButton("Alert", "This is alert", "OK", "Cancel",response =>
        {
            Debug.Log($"alert ok callback: {response}");
        }, response =>
        {
            Debug.Log($"alert cancel callback: {response}");
        });
    }

    public void OpenToast()
    {
        Debug.Log("open toast");
        NativeMessage.GetInstance().ShowToast("This is toast message!", 3.5);
    }
}
