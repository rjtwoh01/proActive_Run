//
//  ExistingPlanViewController.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class ExistingPlanViewController: UIViewController {
    //Buttons
    @IBOutlet var weekOneButton: UIButton!
    @IBOutlet var weekTwoButton: UIButton!
    @IBOutlet var weekThreeButton: UIButton!
    @IBOutlet var weekFourButton: UIButton!
    
    //Info Labels
    @IBOutlet var sundayInfo: UILabel!
    @IBOutlet var mondayInfo: UILabel!
    @IBOutlet var tuesdayInfo: UILabel!
    @IBOutlet var wednesdayInfo: UILabel!
    @IBOutlet var thursdayLabel: UILabel!
    @IBOutlet var fridayInfo: UILabel!
    @IBOutlet var saturdayInfo: UILabel!
    @IBOutlet var raceDistanceInfo: UILabel!
    
    var plan: Plan! {
        didSet {
            navigationItem.title = plan.planName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        raceDistanceInfo.text = numberFormatter.string(from: NSNumber(value: plan.raceDistance))
        
        var number = plan.planDetails[0]
        sundayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[1]
        mondayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[2]
        tuesdayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[3]
        wednesdayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[4]
        thursdayLabel.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[5]
        fridayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"
        number = plan.planDetails[6]
        saturdayInfo.text = numberFormatter.string(from: NSNumber(value: number))! + " mile run"

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
