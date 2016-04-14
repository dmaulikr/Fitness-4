//
//  LikesTableViewCell.swift
//  Fit Space
//
//  Created by bu on 21/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class LikesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelAmountFriends: UILabel!
    @IBOutlet weak var labelPersonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
