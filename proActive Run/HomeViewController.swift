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
    @IBOutlet var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        generateBackground()
        
        let todaysDate = Date()
        DateLabel.text = dateFormatter.string(from: todaysDate)
        let title = "proActive Run"
        TitleLabel.text = "\(title)"
    }
    
    func generateBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background")!)//.withAlphaComponent(0.25)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
