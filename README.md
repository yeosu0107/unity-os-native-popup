# UnityOSNativePopup

UnityOSNativePopup is a unitypackage that helps you use os popup on Unity quickly and easily.

### Feature
* Show Toast Message
* (only Android) Show Dialog
* (only iOS) Show Alert

### Support Platform
* Android
* iOS
> Warning log is returned when used in the Unity editor.

## How to use

For a detailed description of each function, please refer to the [Wiki](https://github.com/yeosu0107/UnityOSNativePopup/wiki).

### Initialize
To use UnityOSNativePopup, you must initialize it.<br/>
Initialize UnityOSNativePopup like this 
```
NativeMessage.GetInstance()?.Initialize(false);
```
> Initialization can be done at any time before using UnityOSNativePopup.<br/>
However, it is recommended to do it within the Start statement of a specific object as much as possible.

### Show One Button Popup
To show One Button Popup, call fuction like this.
```
NativeMessage.GetInstance()?.ShowAlertOneButton("title text", "body text", "ok button text", response =>
{
    Debug.Log($"alert callback: {response}");
});
```

### Show Two Button Popup
To show Two Button Popup, call function like this.
```
NativeMessage.GetInstance()?.ShowAlertTwoButton("title text", "body text", "ok button text", "cancel button text", response =>
{
    Debug.Log($"alert callback: {response}");
}, response =>
{
    Debug.Log($"alert callback: {response}");
});
```

### Show Toast Message
To show Toast Message, call function like this.
```
NativeMessage.GetInstance()?.ShowToast("toast text", duration);
```
> For iOS, you can specify a duration.<br/>
For Android, it is fixed to a specific time. (0 is 2 sec, not 0 is 3.5 sec) 

## Example
You can use example **Assets > NativePopupPlugin > Demo > Demo.unity** in unitypackage
