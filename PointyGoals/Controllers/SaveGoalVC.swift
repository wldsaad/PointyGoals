//
//  SaveGoalVC.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit
import CoreData

class SaveGoalVC: UIViewController {
    
    
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var saveGoalButton: UIButton!
    
    private var goal: Goal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveGoalButton.boundToKeyboard()


    }
    @IBAction func dismissAction(_ sender: UIButton) {
        dismissView()
    }
    

    func updateGoal(goal: Goal) {
        self.goal = goal
    }
   
    @IBAction func saveGoalAction(_ sender: UIButton) {
        guard let target = targetTextField.text  else {
            return
        }
        
        if Int(target)! > 0 {
            self.goal.target = Int32(target)!
            saveGoalToCoreData { (completed) in
                if completed {
                    performSegue(withIdentifier: "dismissAllSegue", sender: nil)
                } else {
                    debugPrint("Can't save")
                }
            }
        }
    }
    
    
    private func saveGoalToCoreData(completion: (_ completed: Bool) -> ()) {
        do {
            try context.save()
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
}
