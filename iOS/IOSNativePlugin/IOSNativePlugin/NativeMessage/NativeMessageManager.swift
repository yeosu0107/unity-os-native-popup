//
//  NativeMessageManager.swift
//  IOSNativePlugin
//
//  Created by sungwoo.yeo on 2021/08/03.
//

import Foundation
import UIKit

class NativeMessageManager : NSObject {
    
    var _viewController : NativeMessageViewController
    
    init(vc: UIViewController) {
        self._viewController = NativeMessageViewController(vc:vc)
    }
    
    func showAlert(title:String, message:String, ok:String) {
        _viewController.showAlert(title: title, message: message, ok: ok)
    }
    
    func showAlert(title:String, message:String, ok:String, cancel: String) {
        _viewController.showAlert(title: title, message: message, ok: ok, cancel: cancel)
    }
    
    func showToast(message:String, duration:Double) {
        _viewController.showToast(message: message, duration: duration)
    }
}
