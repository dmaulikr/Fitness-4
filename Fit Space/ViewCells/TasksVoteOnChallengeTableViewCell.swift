//
//  TasksVoteOnChallengeTableViewCell.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class TasksVoteOnChallengeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAmountOfHours: UILabel!
    @IBOutlet weak var labelHoursLeft: UILabel!
    @IBOutlet weak var labelNameOfChallenge: UILabel!
    @IBOutlet weak var buttonViewAndVote: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
