//
//  NewPlanViewController.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class NewPlanViewController: UIViewController {
    
    @IBOutlet var planName: UITextField!
    @IBOutlet var raceDistance: UITextField!
    @IBOutlet var dateCreatedLabel: UILabel!
    @IBOutlet var addItem: UIBarButtonItem!
    
    var plan: Plan! {
        didSet {
            navigationItem.title = "Add New Plan"
        }
    }
    
    var planCollection: PlanCollection!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Add New Plan"
        navigationItem.rightBarButtonItem = addItem
        let date = Date()
        dateCreatedLabel.text = dateFormatter.string(from: date)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
    }
    
    func texFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addNewPlan() {
        planCollection.createPlan(planName: "", raceDistance: 0)
        plan = planCollection.allPlans.last
        
        plan.planName = planName.text ?? ""
        if let raceDistanceText = raceDistance.text,
            let raceDistanceNumber = numberFormatter.number(from: raceDistanceText) {
            plan.raceDistance = raceDistanceNumber.floatValue
        } else {
            plan.raceDistance = 0
        }
        
        plan.resetPlan() //plan is generated with 0 race distance, have to fix that
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newPlanAdded"?:
            addNewPlan()
            let viewPlanController = segue.destination as! ExistingPlanViewController
            viewPlanController.plan = plan
            break
        default:
            preconditionFailure("Unexpected Segue Identifier")
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
