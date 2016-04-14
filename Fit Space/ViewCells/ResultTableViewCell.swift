//
//  ResultTableViewCell.swift
//  Fit Space
//
//  Created by bu on 19/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNumberOfPerson: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var viewWithButtonPlay: UIView!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var buttonPlayVideo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
