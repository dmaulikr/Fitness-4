//
//  ActiveTourneysTableViewCell.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ActiveTourneysTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAmountDaysLeft: UILabel!
    @IBOutlet weak var labelAmountMoney: UILabel!
    @IBOutlet weak var labelCurrentPosition: UILabel!
    @IBOutlet weak var labelNameOfActiveTourney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
