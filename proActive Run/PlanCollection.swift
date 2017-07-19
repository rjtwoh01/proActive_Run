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
    
    let plansArchieveURL: URL = {
        let documetsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documetsDirectories.first!
        return documentDirectory.appendingPathComponent("plans.archive")
    }()
    
    @discardableResult func createPlan(planName: String, raceDistance: Float) -> Plan {
        let newPlan = Plan(planName: planName, raceDistance: raceDistance)
        allPlans.append(newPlan)
        return newPlan
    }
    
    func movePlan(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedPlan = allPlans[fromIndex]
        allPlans.remove(at: fromIndex)
        allPlans.insert(movedPlan, at: toIndex)
    }
    
    func addPlanAtLocation(newPlan: Plan, indexAt: Int) {
        allPlans.insert(newPlan, at: indexAt)
    }
    
    func removePlan(_ plan: Plan) {
        if let index = allPlans.index(of: plan) {
            allPlans.remove(at: index)
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(plansArchieveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allPlans, toFile: plansArchieveURL.path)
    }
    
    init() {
        if let archievedPlans = NSKeyedUnarchiver.unarchiveObject(withFile: plansArchieveURL.path) as? [Plan] {
            allPlans = archievedPlans
        }
    }
}
