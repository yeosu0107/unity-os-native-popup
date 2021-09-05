//
//  NativeMessageViewController.swift
//  IOSNativePlugin
//
//  Created by sungwoo.yeo on 2021/08/03.
//

import Foundation
import UIKit

class NativeMessageViewController : NSObject {
    let uvc : UIViewController
    let pluginDelegate : NativeMessageProtocol?
    
    init(vc: UIViewController, delegate: NativeMessageProtocol? = nil) {
        self.uvc = vc
        self.pluginDelegate = delegate
        
        if(self.pluginDelegate == nil) {
            print("delegate is null")
        }
    }
    
    func showAlert(title:String, message:String, ok:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: ok, style: UIAlertAction.Style.default, handler: {action in
            self.pluginDelegate?.OnOk()
        }))
        
        uvc.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title:String, message:String, ok:String, cancel:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: ok, style: UIAlertAction.Style.default, handler: {action in
            self.pluginDelegate?.OnOk()
        }))
        alert.addAction(UIAlertAction(title: cancel, style: UIAlertAction.Style.default, handler: {action in
            self.pluginDelegate?.OnCancel()
        }))
        
        uvc.present(alert, animated: true, completion: nil)
    }
    
    func showToast(message: String, duration: Double) {
        let width = widthSizeAboutMessage(message: message)
        let toastLabel = UILabel(frame: CGRect(x: uvc.view.frame.size.width/2-width/2, y: uvc.view.frame.size.height-100, width: width, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.text = message
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        uvc.view.addSubview(toastLabel)
        UIView.animate(withDuration: duration, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    private func widthSizeAboutMessage(message: String) -> CGFloat {
        let tempLabel = UILabel()
        tempLabel.font = UIFont.systemFont(ofSize: 14)
        tempLabel.text = message
        
        return tempLabel.intrinsicContentSize.width + 51.5
    }
}
