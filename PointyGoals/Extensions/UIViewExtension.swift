//
//  UIViewExtension.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

extension UIView {
    
    func boundToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(setDeltaY(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func setDeltaY(_ notification: NSNotification){
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let beginFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - beginFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += (deltaY )
        }, completion: nil)
    }
}
