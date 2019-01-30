//
//  ViewController.swift
//  PointyGoals
//
//  Created by Waleed Saad on 1/30/19.
//  Copyright © 2019 Waleed Saad. All rights reserved.
//

import UIKit
import CoreData

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class GoalsVC: UIViewController {

    @IBOutlet weak var goalsTableView: UITableView!
    @IBAction func UNWIND_TO_GOALSVC(seque: UIStoryboardSegue) {
        
    }
    private var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateGoals()
    }
    
    private func fetchGoals(completion: (_ completed: Bool, _ fetchedGoals: [Goal]) -> ()) {
        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            let fetchedGoals = try context.fetch(fetchRequest)
            completion(true, fetchedGoals)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false, [Goal]())
        }
    }
    
    private func updateGoals() {
        fetchGoals { (completed, fetchedGoals) in
            if ( completed && fetchedGoals.count > 0) {
                self.goals = fetchedGoals
                self.goalsTableView.reloadData()
                self.goalsTableView.isHidden = false
            } else {
                self.goalsTableView.isHidden = true
            }
        }
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (action, indexPath) in
            context.delete(self.goals[indexPath.row])
            do {
                try context.save()
                self.goals.remove(at: indexPath.row)
                self.goalsTableView.deleteRows(at: [indexPath], with: .automatic)
                if self.goals.count > 0 {
                    self.goalsTableView.isHidden = false
                } else {
                    self.goalsTableView.isHidden = true
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        
        return [deleteAction]
    }
    
}
