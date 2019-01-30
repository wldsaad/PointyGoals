//
//  ViewController.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class GoalsVC: UIViewController {

    @IBOutlet weak var goalsTableView: UITableView!
    
    private var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func fetchGoals() {
        
    }

    @IBAction func addGoalAction(_ sender: UIButton) {
        guard let addGoalVC = storyboard?.instantiateViewController(withIdentifier: "AddGoalVC") else {
            return
        }
        presentView(addGoalVC)
    }
    
}

extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == goalsTableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell {
                cell.updateView(goal: goals[indexPath.row])
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
}
