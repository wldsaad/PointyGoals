//
//  UIViewControllerExtension.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentView(_ viewToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        view.window?.layer.add(transition, forKey: kCATransition)
        self.present(viewToPresent, animated: false, completion: nil)
    }
    
    func dismissView() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
