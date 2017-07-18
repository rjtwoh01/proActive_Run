//
//  HomeViewController.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/13/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    //This will be the clas that contains the home view
    //This will essentially just be buttons that take us to other parts of the application
    @IBOutlet var EnterNewRun: UIButton!
    @IBOutlet var GeneratePlan: UIButton!
    @IBOutlet var ViewPastPlans: UIButton!
    //@IBOutlet var ViewPastRuns: UIButton!
    @IBOutlet var ViewPastRuns: UIButton!
    @IBOutlet var DateLabel: UILabel!
    //@IBOutlet var TitleLabel: UILabel!
    
    var runCollection: RunCollection!
    var planCollection: PlanCollection!
    
    override func viewDidLoad() {
        generateBackground()
        
        let todaysDate = Date()
        DateLabel.text = dateFormatter.string(from: todaysDate)
        //let title = "proActive Run"
        //TitleLabel.text = "\(title)"
        
        navigationItem.title = "proActive Run"
    }
    
    func generateBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background")!)//.withAlphaComponent(0.25)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newRun"?:
            let newRunController = segue.destination as! NewRunViewController
            newRunController.runCollect = runCollection
        case "runList"?:
            let runListController = segue.destination as! RunViewController
            runListController.runCollection = runCollection
        case "newPlan"?:
            let newPlanController = segue.destination as! NewPlanViewController
            newPlanController.planCollection = planCollection
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
