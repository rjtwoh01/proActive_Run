//
//  PlanCollection.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class PlanCollection {
    var allPlans = [Plan]()
    
    @discardableResult func createPlan(planName: String, raceDistance: Float) -> Plan {
        let newPlan = Plan(planName: planName, raceDistance: raceDistance)
        allPlans.append(newPlan)
        return newPlan
    }
}
