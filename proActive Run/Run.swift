//
//  Run.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/14/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class Run: NSObject, NSCoding{
    var distance: Float
    var time: Float
    var date: Date
    var speed: Float
    var intendedDistance: Float
    
    //Post run selfie?
    //Social media buttons? - Future implementation probably
    
    init(distance: Float, time: Float, date: Date, speed: Float, intendedDistance: Float) {
        self.distance = distance
        self.time = time
        self.date = date
        self.speed = speed
        self.intendedDistance = intendedDistance
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(distance, forKey: "distance")
        aCoder.encode(time, forKey: "time")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(speed, forKey: "speed")
        aCoder.encode(intendedDistance, forKey: "intendedDistance")
    }
    
    required init(coder aDecoder: NSCoder) {
        distance = aDecoder.decodeFloat(forKey: "distance")
        time = aDecoder.decodeFloat(forKey: "time")
        date = aDecoder.decodeObject(forKey: "date") as! Date
        speed = aDecoder.decodeFloat(forKey: "speed")
        intendedDistance = aDecoder.decodeFloat(forKey: "intendedDistance")
    }
}
