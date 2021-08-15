#if UNITY_IOS
using UnityEngine;
using System.Runtime.InteropServices;

namespace NativePopup
{
    public class IOSNativeMessage : MonoBehaviour, INativeMessage
    {
        #region IOS_FUNCTION

        [DllImport("__Internal")]
        private static extern void _init();

        [DllImport("__Internal")]
        private static extern void _ShowAlertOneButton(string title, string message, string ok);

        [DllImport("__Internal")]
        private static extern void _ShowAlertTwoButton(string title, string message, string ok, string cancel);

        [DllImport("__Internal")]
        private static extern void _ShowToast(string message, double seconds);

        #endregion

        private const string objectName = "NativeMessageObject";
        private static IOSNativeMessage instance = null;

        private ButtonCallback okCallback = null;
        private ButtonCallback cancelCallback = null;

        public static IOSNativeMessage GetInstance()
        {
            if (instance == null)
            {
                var emptyObj = new GameObject(objectName).AddComponent<IOSNativeMessage>();
                instance = emptyObj.GetComponent<IOSNativeMessage>();

#if !UNITY_EDITOR
        _init();
#endif
            }

            return instance;
        }

        public void ShowAlertOneButton(string title, string message, string okStr, ButtonCallback callback = null)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_IOS
        return;
#endif
            if (callback != null)
            {
                okCallback += callback;
            }

            _ShowAlertOneButton(title, message, okStr);
        }

        public void ShowAlertTwoButton(string title, string message, string okStr, string cancelStr,
            ButtonCallback okCallback = null, ButtonCallback cancelCallback = null)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_IOS
        return;
#endif
            if (okCallback != null)
            {
                this.okCallback += okCallback;
            }

            if (cancelCallback != null)
            {
                this.cancelCallback += cancelCallback;
            }

            _ShowAlertTwoButton(title, message, okStr, cancelStr);
        }

        public void ShowToast(string message, double seconds)
        {
#if UNITY_EDITOR
            Debug.LogWarning("NativeMessage not support editor");
            return;
#elif !UNITY_IOS
        return;
#endif
            _ShowToast(message, seconds);
        }

        public void OnOk(string response)
        {
            okCallback?.Invoke(response);
            okCallback = null;
        }

        public void OnCancel(string response)
        {
            cancelCallback?.Invoke(response);
            cancelCallback = null;
        }
    }
}
#endif