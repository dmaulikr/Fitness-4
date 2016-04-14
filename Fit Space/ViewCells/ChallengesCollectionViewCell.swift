//
//  ChallengesCollectionViewCell.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ChallengesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var constraintButtonMoreTopFromView: NSLayoutConstraint!
    @IBOutlet weak var buttonMoreOfCurrentChallenge: UIButton!
    @IBOutlet weak var labelNameOfCurrentChallenge: UILabel!
    @IBOutlet weak var labelAmountOfPoints: UILabel!
    @IBOutlet weak var view: UIView!
}
