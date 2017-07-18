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
    
    var plan: Plan! {
        didSet {
            navigationItem.title = "Add New Plans"
        }
    }
    
    var planCollection: PlanCollection!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
