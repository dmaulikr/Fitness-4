//
//  CurrentChallengeCommentsTableViewCell.swift
//  Fit Space
//
//  Created by bu on 19/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit


class CurrentChallengeCommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var labelHoursAgo: UILabel!
    @IBOutlet weak var buttonReply: UIButton!
    
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
