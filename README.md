# UnityOSNativePopup

UnityOSNativePopup is a unitypackage that helps you use os popup on Unity quickly and easily.

### Feature
* Show Toast Message
* (only Android) Show Dialog
* (only iOS) Show Alert

### Support Platform
* Android
<img width="500" alt="Android" src="https://user-images.githubusercontent.com/27134499/136758133-4e030ba6-83f5-41b4-bf37-4aef1672af04.png">

* iOS
<img width="500" alt="iOS" src="https://user-images.githubusercontent.com/27134499/136758166-42b00852-5cab-4499-951f-b34b02eb82ae.png">

> Warning log is returned when used in the Unity editor.

## Getting Started
You can install UnityOSNativePopup into your Unity project using the unitypackage.<br/>
Download the latest version from [release](https://github.com/yeosu0107/UnityOSNativePopup/releases).<br/>
And import the downloaded unitypackage into your project.


## How to use

For a detailed description of each function, please check to the [Wiki](https://github.com/yeosu0107/UnityOSNativePopup/wiki).

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
> On iOS, you can specify a duration.<br/>
On Android, it is fixed to a specific time. (0 is 2 sec, not 0 is 3.5 sec) 

## Example
You can use example **Assets > NativePopupPlugin > Demo > Demo.unity** in unitypackage
