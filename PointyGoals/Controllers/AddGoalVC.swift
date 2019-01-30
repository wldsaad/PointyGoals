//
//  AddGoalVC.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: KMPlaceholderTextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectShortTerm()
        nextButton.boundToKeyboard()
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismissView()
    }
    
    private func selectShortTerm() {
        shortTermButton.setSelected(withBackgroundColor: #colorLiteral(red: 0, green: 0.6136431098, blue: 0, alpha: 1), andTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        longTermButton.setSelected(withBackgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), andTextColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        goalType = .shortTerm
    }
    
    private func selectLongTerm() {
        longTermButton.setSelected(withBackgroundColor: #colorLiteral(red: 0, green: 0.6136431098, blue: 0, alpha: 1), andTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        shortTermButton.setSelected(withBackgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), andTextColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        goalType = .longTerm
    }
    
    @IBAction func selectShortTermAction(_ sender: UIButton) {
        selectShortTerm()

    }
    @IBAction func selectLongTermAction(_ sender: UIButton) {
        selectLongTerm()

    }
    @IBAction func nextAction(_ sender: UIButton) {
        guard let goalTitle = goalTextView.text else {
            return
        }
        if goalTitle.count > 0 {
            let goal = Goal(context: context)
            goal.title = goalTitle
            goal.type = goalType.rawValue
            goal.score = 0
            
            guard let saveVC = storyboard?.instantiateViewController(withIdentifier: "SaveGoalVC") as? SaveGoalVC else {
                return
            }
            saveVC.updateGoal(goal: goal)
            presentView(saveVC)
        }
    }
    
}
