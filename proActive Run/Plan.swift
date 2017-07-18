//
//  Plan.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class Plan: NSObject {
    var planName: String
    var raceDistance: Float
    var planDetails = [Float]() //A 2D array, weeks by days
    //This array will be used to set the distance that the runner goes that day
    
    init(planName: String, raceDistance: Float) {
        self.planName = planName
        self.raceDistance = raceDistance
        super.init()
        self.planDetails = generatePlan()
        
    }
    
    func generatePlan() -> [Float] {
        var plan = [Float]()
        
        plan.append(0)
        if raceDistance > 0 {
            plan.append(raceDistance / 4)
            plan.append(raceDistance / 3)
            plan.append(raceDistance / 2)
            plan.append(raceDistance / 2)
            plan.append(raceDistance - 1)
            plan.append(raceDistance / 2)
        }
        else {
            plan.append(0)
            plan.append(0)
            plan.append(0)
            plan.append(0)
            plan.append(0)
            plan.append(0)
        }
        
        return plan
    }
    
    func resetPlan() {
        planDetails.removeAll()
        planDetails.append(0)
        if raceDistance > 0 {
            planDetails.append(raceDistance / 4)
            planDetails.append(raceDistance / 3)
            planDetails.append(raceDistance / 2)
            planDetails.append(raceDistance / 2)
            planDetails.append(raceDistance - 1)
            planDetails.append(raceDistance / 2)
        }
        else {
            planDetails.append(0)
            planDetails.append(0)
            planDetails.append(0)
            planDetails.append(0)
            planDetails.append(0)
        }

    }
}
