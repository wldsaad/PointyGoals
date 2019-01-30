//
//  UIButtonExtension.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelected(withBackgroundColor backColor: UIColor, andTextColor textColor: UIColor) {
        backgroundColor = backColor
        setTitleColor(textColor, for: .normal)
    }
    
    
}
