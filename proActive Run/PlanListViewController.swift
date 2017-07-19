//
//  PlanListViewController.swift
//  proActive plan
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class PlanListViewController: UITableViewController {
    var planCollection: PlanCollection!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planCollection.allPlans.count
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        //Update the model
        planCollection.movePlan(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        //If the Table view is asking to commit a delete command...
        if editingStyle == .delete {
            let plan = planCollection.allPlans[indexPath.row]
            
            let title = "Remove \(plan.planName)?"
            let message = "Are you sure you want to delete this plan?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                //Remove the plan from teh Collection
                self.planCollection.removePlan(plan)
                
                //Remove the plan from the image Collection
                //self.imageCollection.deleteImage(forKey: plan.planKey)
                
                //Also remove that row from the table view iwth an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            //Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Get a new or recycled cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! PlanCell
        
        //Set the text on the cell with the description of the plan
        //that is at the nth index of plans, where n = row this cell
        //will appear in on the tableview
        let plan = planCollection.allPlans[indexPath.row]
        
        //cell.textLabel?.text = plan.name
        //cell.detailTextLabel?.text = "$\(plan.valueInDollars)"
        
        //Configure the cell with the plan
        cell.planNameLabel.text = plan.planName
        cell.distanceLabel.text = "\(plan.raceDistance) miles"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String
    {
        return "Remove"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Past Plans"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editPlanFromList"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let plan = planCollection.allPlans[row]
                let editPlanViewController = segue.destination as! ExistingPlanViewController
                editPlanViewController.plan = plan
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
}
