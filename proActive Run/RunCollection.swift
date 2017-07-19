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
    
    let runsArchieveURL: URL = {
        let documetsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documetsDirectories.first!
        return documentDirectory.appendingPathComponent("runs.archieve")
    }()
    
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
    
    func removeRun(_ run: Run) {
        if let index = allRuns.index(of: run) {
            allRuns.remove(at: index)
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(runsArchieveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allRuns, toFile: runsArchieveURL.path)
    }
    
    init() {
        if let archivedRuns = NSKeyedUnarchiver.unarchiveObject(withFile: runsArchieveURL.path) as? [Run] {
            allRuns = archivedRuns
        }
    }
}
