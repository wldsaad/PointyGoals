//
//  SaveGoalVC.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

class SaveGoalVC: UIViewController {

    private var goal: Goal!
    override func viewDidLoad() {
        super.viewDidLoad()


        debugPrint(goal.title, goal.score, goal.type)
    }
    @IBAction func dismissAction(_ sender: UIButton) {
        dismissView()
    }
    

    func updateGoal(goal: Goal) {
        self.goal = goal
    }
   

}
