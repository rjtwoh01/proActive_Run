//
//  NewRunViewController.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/14/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class NewRunViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate  {
    @IBOutlet var distanceField: UITextField!
    @IBOutlet var intendedDistanceField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var speedField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var dateCreatedLabel: UILabel!
    @IBOutlet var addItem: UIBarButtonItem!
    
    var run: Run! {
        didSet {
            navigationItem.title = "Add New Run"
        }
    }
    
    var runCollect: RunCollection!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Add New Run"
        navigationItem.rightBarButtonItem = addItem
        //Will need a way to check if its a new or existing run
        //Maybe I will have to go with two views
        /*distanceField.text = numberFormatter.string(from: NSNumber(value: run.distance))
        intendedDistanceField.text = numberFormatter.string(from: NSNumber(value: run.intendedDistance))
        timeField.text = numberFormatter.string(from: NSNumber(value: run.time))
        speedField.text = numberFormatter.string(from: NSNumber(value: run.speed))
        */
        let date = Date()
        dateField.text = dateFormatter.string(from: date)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
    
    @IBAction func addNewRun(_ sender: UIBarButtonItem) {
        let date = Date()
        runCollect.createItem(distance: 0, time: 0, date: date, speed: 0, intendedDistance: 0)
        //let end = runCollect.allRuns.endIndex
        run = runCollect.allRuns.last
        
        //distance
        if let distanceText = distanceField.text,
            let distance = numberFormatter.number(from: distanceText) {
            run.distance = distance.floatValue
        } else {
            run.distance = 0
        }
        
        //intended distance
        if let intendedDistanceText = intendedDistanceField.text,
            let intendedDistance = numberFormatter.number(from: intendedDistanceText) {
            run.intendedDistance = intendedDistance.floatValue
        } else {
            run.intendedDistance = 0
        }
        
        //time
        if let timeText = timeField.text,
            let time = numberFormatter.number(from: timeText) {
            run.time = time.floatValue
        } else {
            run.time = 0
        }
        
        //speed
        if let speedText = speedField.text,
            let speed = numberFormatter.number(from: speedText) {
            run.speed = speed.floatValue
        } else {
            run.speed = 0
        }
        
        //date
        if let dateText = dateField.text,
            let date = dateFormatter.date(from: dateText) {
            run.date = date
        } else {
            run.date = Date()
        }
    }
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
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
