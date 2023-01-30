using UnityEngine;
using NativePopup;

public class DemoScript : MonoBehaviour
{
    public void Start()
    {
        NativeMessage.GetInstance()?.Initialize(true);
    }
    public void OpenAlertOne()
    {
        Debug.Log("open alert with one button");
        NativeMessage.GetInstance()?.ShowAlertOneButton("AlertMessage", "This is alert", "OK", response =>
        {
            Debug.Log($"alert callback: {response}");
        });
    }

    public void OpenAlertTwo()
    {
        Debug.Log("open alert with two button");
        NativeMessage.GetInstance()?.ShowAlertTwoButton("AlertMessage", "This is alert", "OK", "CANCEL",response =>
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
        double duration = 0;
#if UNITY_IOS
        duration = duration == 0 ? 2 : 4;
#endif
        NativeMessage.GetInstance()?.ShowToast("This is toast message!", duration);
    }
}
