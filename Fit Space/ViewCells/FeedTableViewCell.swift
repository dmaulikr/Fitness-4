//
//  FeedTableViewCell.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var imageViewBefore: UIImageView!
    @IBOutlet weak var imageViewAfter: UIImageView!
    @IBOutlet weak var labelHoursAgo: UILabel!
    @IBOutlet weak var labelFeedback: UILabel!
    @IBOutlet weak var labelWeeksAgo: UILabel!
    @IBOutlet weak var labelLostPounds: UILabel!
    @IBOutlet weak var labelNow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
