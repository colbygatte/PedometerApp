//
//  PedometerTableViewCell.swift
//  PedometerApp
//
//  Created by Colby Gatte on 11/8/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class PedometerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
