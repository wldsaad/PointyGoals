//
//  GoalCell.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit
import CoreData

class GoalCell: UITableViewCell {

    private var goalView: GoalXibView?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        initView()
    }

    private func initView() {
        goalView = Bundle.main.loadNibNamed("GoalXib", owner: self, options: nil)?.first as? GoalXibView
        goalView?.frame = self.frame
        if goalView != nil {
            self.addSubview(goalView!)
        }
    }
    
    func updateView(goal: Goal) {
        goalView?.goalLabel.text = goal.title
        goalView?.typeLabel.text = goal.type
        goalView?.scoreLabel.text = String(describing: goal.score)
        
    }

}
