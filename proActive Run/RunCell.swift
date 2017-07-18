//
//  RunCell.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/16/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class RunCell: UITableViewCell {
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        distanceLabel.adjustsFontForContentSizeCategory = true
        timeLabel.adjustsFontForContentSizeCategory = true
        dateLabel.adjustsFontForContentSizeCategory = true
    }
}
