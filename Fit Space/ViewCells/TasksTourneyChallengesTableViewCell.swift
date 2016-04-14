//
//  TasksTourneyChallengesTableViewCell.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class TasksTourneyChallengesTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAmountOfDays: UILabel!
    @IBOutlet weak var labelDaysLeft: UILabel!
    @IBOutlet weak var labelNameOfChallenge: UILabel!
    @IBOutlet weak var buttonAddVideoOrPicture: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
