//
//  StandingsCompetitorsITableViewCell.swift
//  Fit Space
//
//  Created by bu on 22/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class StandingsCompetitorsITableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelNumberOfPerson: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPoints: UILabel!
    @IBOutlet weak var imageViewAvatar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
