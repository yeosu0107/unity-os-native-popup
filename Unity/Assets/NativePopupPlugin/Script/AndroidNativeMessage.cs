#if UNITY_ANDROID
using System.Collections;
using System.Collections.Generic;
using NativePopup;
using UnityEngine;

public class AndroidNativeMessage : MonoBehaviour, INativeMessage
{
#if !UNITY_EDITOR
    private const string className = "com.nativeplugin.androidnativeplugin.NativeMessage";
    
#endif

    private static AndroidJavaObject androidObj = null;
    private const string objectName = "NativeMessageObject";
    private static AndroidNativeMessage instance = null;
    
    public static AndroidNativeMessage GetInstance()
    {
        if (instance == null)
        {
            var emptyObj = new GameObject(objectName).AddComponent<AndroidNativeMessage>();
            instance = emptyObj.GetComponent<AndroidNativeMessage>();
        }
    
        return instance;
    }
    
    public void Initialize(bool isDontDestoryOnLoad = false)
    {
        if (isDontDestoryOnLoad == true)
        {
            DontDestroyOnLoad(this.gameObject);
        }

#if !UNITY_EDITOR
        androidObj = new AndroidJavaObject(className);
        if (androidObj == null)
        {
            Debug.Log("androidObj is null");
        }
#endif
    }
    
        public void ShowAlertOneButton(string title, string message, string okStr, ButtonCallback callback = null)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_ANDROID
            return;
#endif
        }

        public void ShowAlertTwoButton(string title, string message, string okStr, string cancelStr,
            ButtonCallback okCallback = null, ButtonCallback cancelCallback = null)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_ANDROID
            return;
#endif
        }

        public void ShowToast(string message, double seconds)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_ANDROID
            return;
#endif
            androidObj.CallStatic("showToast", message);
        }

        public void OnOk(string response)
        {

        }

        public void OnCancel(string response)
        {

        }
}
#endif