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
    var planDetails = [[Float]]() //A 2D array, weeks by days
    //This array will be used to set the distance that the runner goes that day
    
    init(planName: String, raceDistance: Float) {
        self.planName = planName
        self.raceDistance = raceDistance
        self.planDetails = generatePlan()
        
        super.init()
    }
    
    func generatePlan() -> [[Float]] {
        var plan = [[Float]]()
        for i in 0...3 {
            for j in 0...6 {
                if j == 0 {
                    plan[i][j] = 0 //0 means "rest"
                }
                else if j == 1 {
                    plan[i][j] = raceDistance / 4
                }
                else if j == 2 {
                    plan[i][j] = raceDistance / 3
                }
                else if j == 3 || j == 4 || j == 6 {
                    plan[i][j] = raceDistance / 2
                }
                else if j == 5 {
                    plan[i][j] = raceDistance - 1
                }
            }
        }
        
        return plan
    }
}
