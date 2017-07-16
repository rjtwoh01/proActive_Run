//
//  RunCollection.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/16/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class RunCollection {
    var allRuns = [Run]()
    //ToDo: Storage
    
    @discardableResult func createItem(distance: Float, time: Float, date: Date, speed: Float, intendedDistance: Float) -> Run {
        let newRun = Run(distance: distance, time: time, date: date, speed: speed, intendedDistance: intendedDistance)
        allRuns.append(newRun)
        return newRun
    }
    
    func moveRun(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedRun = allRuns[fromIndex]
        allRuns.remove(at: fromIndex)
        allRuns.insert(movedRun, at: toIndex)
    }
    
    //Could be a useful function to have
    func addRunAtLocation(newRun: Run, indexAt: Int)
    {
        allRuns.insert(newRun, at: indexAt)
    }
    
    func removeRun(indexFrom: Int) {
        allRuns.remove(at: indexFrom)
    }
}
