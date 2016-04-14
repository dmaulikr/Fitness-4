//
//  ChallengesViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

var nameOfCurrentTourneyForChallenge: String = ""

var isItActiveTourney: Bool = true

class ChallengesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var constraintCollectionViewHeight: NSLayoutConstraint!
    
    private let reuseIdentifier = "challengeForCurrentTourney"
    
    //test data
    let challengesOfCurrentTourney = ["Complete 30 pushups in the next 6 hours", "Second challenge", "Third challenge", "Fourth challenge"]
    let amountOfPoints = ["10", "999", "4", "2"]
    let isItSubmitedVideo = [true, false, false, true]


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make horizontal scroll and set images in one line
        let layoutCollectionView = UICollectionViewFlowLayout()
        layoutCollectionView.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView.setCollectionViewLayout(layoutCollectionView, animated: true)

        //enable buttons highlight
        collectionView.delaysContentTouches = false
        scrollView.delaysContentTouches = false
    }
    
    override func viewDidAppear(animated: Bool) {
        constraintCollectionViewHeight.constant = collectionView.contentSize.height
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    //how many sections are to be displayed
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //to identify the number of items that are to be displayed in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return challengesOfCurrentTourney.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ChallengesCollectionViewCell
        
        cell.view.layer.borderWidth = 2
        cell.view.layer.borderColor = UIColor(red: 255.0 / 255.0, green: 60.0 / 255.0, blue: 0.0 / 255.0, alpha: CGFloat(1.0)).CGColor
        cell.view.layer.cornerRadius = (collectionView.frame.size.height - 10) / 2
        cell.labelNameOfCurrentChallenge.text = challengesOfCurrentTourney[indexPath.row]
        cell.labelAmountOfPoints.text = amountOfPoints[indexPath.row]
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        switch screenHeight {
        case 480: // 3.5 inch
            cell.labelNameOfCurrentChallenge.font = UIFont(name: "Helvetica", size: 14)
            cell.labelAmountOfPoints.font = UIFont(name: "Helvetica", size: 14)
            cell.constraintButtonMoreTopFromView.constant = 4
        case 568: // 4 inch
            cell.labelNameOfCurrentChallenge.font = UIFont(name: "Helvetica", size: 17)
            cell.labelAmountOfPoints.font = UIFont(name: "Helvetica", size: 17)
            cell.constraintButtonMoreTopFromView.constant = 8
        default: // rest of screen sizes
            cell.labelNameOfCurrentChallenge.font = UIFont(name: "Helvetica", size: 18)
            cell.labelAmountOfPoints.font = UIFont(name: "Helvetica", size: 18)
            cell.constraintButtonMoreTopFromView.constant = 8
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let collectionViewSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
        return collectionViewSize
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("detailChallengeViewController") as! CurrentChallengeViewController
        destination.nameOfChallengeOfCurrentTourney = challengesOfCurrentTourney[indexPath.row]
        destination.nameOfCurrentTourney = nameOfCurrentTourneyForChallenge
        destination.amountOfPoints = amountOfPoints[indexPath.row]
        destination.isItSubmitedVideo = isItSubmitedVideo[indexPath.row]
        self.presentViewController(destination, animated: true, completion: nil)
    }
}
