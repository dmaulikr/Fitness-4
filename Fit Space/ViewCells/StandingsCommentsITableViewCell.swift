//
//  StandingsCommentsITableViewCell.swift
//  Fit Space
//
//  Created by bu on 22/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class StandingsCommentsITableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelPersonName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelHoursAgo: UILabel!
    @IBOutlet weak var viewWithLikeButton: UIView!
    
    @IBOutlet weak var labelLikeButton: UILabel!
    @IBOutlet weak var imageLikeButton: UIImageView!
    @IBOutlet weak var labelAmountLikeButton: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
