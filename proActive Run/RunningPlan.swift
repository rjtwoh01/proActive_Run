//
//  RunningPlan.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/16/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class RunningPlan {
    var planName: String
    var planDescription: String
    var raceDistance: Float
    
    init(planName: String, planDescription: String, raceDistance: Float) {
        self.planName = planName
        self.planDescription = planDescription
        self.raceDistance = raceDistance
    }
}
