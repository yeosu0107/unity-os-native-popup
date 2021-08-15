//
//  NativeMessage.swift
//  IOSNativePlugin
//
//  Created by sungwoo.yeo on 2021/08/03.
//

import UIKit

@objc public class NativeMessage : NSObject {
    static let shared = NativeMessage()
    
    var nativeViewController : NativeMessageViewController?
    
    override init() {
        super.init()
    }
    
    @objc public static func getInstance() -> NativeMessage {
        return shared
    }
    
    @objc public func initialize(vc: UIViewController, delegate: NativeMessageProtocol? = nil) {
        self.nativeViewController = NativeMessageViewController(vc: vc, delegate: delegate)
    }
    
    @objc public func showAlert(title:String, message:String, ok:String) {
        nativeViewController?.showAlert(title: title, message: message, ok: ok)
    }
    
    @objc public func showAlert(title:String, message:String, ok:String, cancel:String) {
        nativeViewController?.showAlert(title: title, message: message, ok: ok, cancel: cancel)
    }
    
    @objc public func showToast(message:String, seconds:Double) {
        nativeViewController?.showToast(message: message, seconds: seconds)
    }
}

@objc public protocol NativeMessageProtocol : AnyObject {
    @objc func OnOk()
    @objc func OnCancel()
}

