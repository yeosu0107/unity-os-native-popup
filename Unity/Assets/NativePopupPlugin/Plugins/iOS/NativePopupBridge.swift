import NativePopup

class BridgeDelegate: NativePopupProtocol {
    static let nativeMessageObjName = "NativeMessageObject"
    
    func OnOK() {
        UnityFramework().sendMessageToGO(withName: BridgeDelegate.nativeMessageObjName, functionName: "OnOk", message: "this is swift ok callback")
    }
    
    func OnCancel() {
        UnityFramework().sendMessageToGO(withName: BridgeDelegate.nativeMessageObjName, functionName: "OnCancel", message: "this is swift cancel callback")
    }
}

private func unsafePtrToString(input: UnsafePointer<CChar>) -> String {
    if let str = String(validatingUTF8: input) {
        return str
    } else {
        return ""
    }
}

@_cdecl("_ShowAlertOneButton")
public func showAlertOneBtn(title: UnsafePointer<CChar>, message: UnsafePointer<CChar>, okBtn: UnsafePointer<CChar>) {
    let mgr = NativePopupManager()
    let delegate = BridgeDelegate()
    
    let titleStr = unsafePtrToString(input: title)
    let messageStr = unsafePtrToString(input: message)
    let okBtnStr = unsafePtrToString(input: okBtn)
    
    mgr.showAlert(title: titleStr, message: messageStr, ok: okBtnStr, delegate: delegate)
}
/*
@_cdecl("_ShowAlertTwoButton")
public func showAlertOneBtn(title: UnsafePointer<CChar>, message: UnsafePointer<CChar>, okBtn: UnsafePointer<CChar>, cancelBtn: UnsafePointer<CChar>) {
    let mgr = NativePopupManager()
    let delegate = BridgeDelegate()
    
    let titleStr = unsafePtrToString(input: title)
    let messageStr = unsafePtrToString(input: message)
    let okBtnStr = unsafePtrToString(input: okBtn)
    let cancelBtnStr = unsafePtrToString(input: cancelBtn)
    
    mgr.showAlert(title: titleStr, message: messageStr, ok: okBtnStr, cancel: cancelBtnStr, delegate: delegate)
}

@_cdecl("_ShowToast")
public func showAlertOneBtn(message: UnsafePointer<CChar>, duration: Double) {
    let mgr = NativePopupManager()
    
    let messageStr = unsafePtrToString(input: message)

    mgr.showToast(message: messageStr, duration: duration)
}
*/