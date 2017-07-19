//
//  PlanCell.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/18/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class PlanCell: UITableViewCell {
    
    @IBOutlet var planNameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        planNameLabel.adjustsFontForContentSizeCategory = true
        distanceLabel.adjustsFontForContentSizeCategory = true
    }
}
