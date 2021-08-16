using UnityEngine;

namespace NativePopup
{
    public delegate void ButtonCallback(string response);
    public interface INativeMessage
    {
        void Initialize(bool isDontDestoryOnLoad = false);
        
        void ShowAlertOneButton(string title, string message, string okStr, ButtonCallback callback = null);
        void ShowAlertTwoButton(string title, string message, string okStr, string cancelStr, ButtonCallback okCallback = null, ButtonCallback cancelCallback = null);
        void ShowToast(string message, double seconds);

        void OnOk(string response);
        void OnCancel(string response);
    }

    public class NativeMessage
    {
        public static INativeMessage GetInstance()
        {
            
#if UNITY_IOS
            return IOSNativeMessage.GetInstance();
#elif UNITY_ANDROID
            Debug.LogWarning("NativeMessage dose not support android platform yet.");
            return null;
#endif
            Debug.LogError("NativeMessage supports only ios and android platform.");
            return null;
        }
    }
}
