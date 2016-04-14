//
//  CreateTourneyViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class CreateTourneyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //test data
    let nameOfTourneysWithFriends = ["Michael and Friends Tourney", "Second tourney with long long long long long long long name", "Third tourney"]
    let moneyTourneyWithFriends = ["$1250", "$99", "$9999999", "$100"]
    let daysTourneyWithFriends = ["7", "99999", "100", "5"]
    let friendsTourneyWithFriends = ["2", "99999", "9", "3"]
    let nameOfTourneysWithTrainers = ["Jake Family Tourney", "Trainer and Another Trainer Tourney", "Third tourney"]
    let moneyTourneyWithTrainers = ["$250", "$99", "$9999999", "$100"]
    let daysTourneyWithTrainers = ["3", "99999", "100", "5"]
    let friendsTourneyWithTrainers = ["15", "99999", "9", "3"]
    let backgroundCellImages = ["backgroundCell1", "backgroundCell2", "backgroundCell3"]
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buttonCreateYourOwn: UIButton!
    @IBOutlet weak var labelWithFriends: UILabel!
    @IBOutlet weak var labelSwipeToSeeMoreTourneysWithFriends: UILabel!
    @IBOutlet weak var labelSwipeToSeeMoreTourneysWithTrainers: UILabel!
    @IBOutlet weak var labelWithTrainers: UILabel!
    
    @IBOutlet weak var collectionViewTourneyWithFriends: UICollectionView!
    @IBOutlet weak var constraintCollectionViewTourneyWithFriendsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewTourneyWithTrainers: UICollectionView!
    @IBOutlet weak var constraintCollectionViewTourneyWithTrainers: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure bar buttons
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBackFromCreateTourney"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(CreateTourneyViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 92, 17)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.navigationItem.leftBarButtonItem = barButtonBack

        self.navigationItem.title = "Create"
        
        //to hide keyboard when tap anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateTourneyViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        buttonCreateYourOwn.layer.cornerRadius = 15.0
        
        //enable buttons highlight
        scrollView.delaysContentTouches = false
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        switch screenHeight {
        case 480: // 3.5 inch
            labelWithFriends.font = UIFont(name: "Helvetica", size: 11)
            labelSwipeToSeeMoreTourneysWithFriends.font = UIFont(name: "Helvetica", size: 11)
            labelWithTrainers.font = UIFont(name: "Helvetica", size: 11)
            labelSwipeToSeeMoreTourneysWithTrainers.font = UIFont(name: "Helvetica", size: 11)
        case 568: // 4 inch
            labelWithFriends.font = UIFont(name: "Helvetica", size: 11)
            labelSwipeToSeeMoreTourneysWithFriends.font = UIFont(name: "Helvetica", size: 11)
            labelWithTrainers.font = UIFont(name: "Helvetica", size: 11)
            labelSwipeToSeeMoreTourneysWithTrainers.font = UIFont(name: "Helvetica", size: 11)
        default: // rest of screen sizes
            labelWithFriends.font = UIFont(name: "Helvetica", size: 15)
            labelSwipeToSeeMoreTourneysWithFriends.font = UIFont(name: "Helvetica", size: 15)
            labelWithTrainers.font = UIFont(name: "Helvetica", size: 15)
            labelSwipeToSeeMoreTourneysWithTrainers.font = UIFont(name: "Helvetica", size: 15)
        }
        
        //make horizontal scroll and set images in one line
        let layoutCollectionViewWithFriends = UICollectionViewFlowLayout()
        let layoutCollectionViewWithTrainers = UICollectionViewFlowLayout()
        layoutCollectionViewWithFriends.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layoutCollectionViewWithFriends.minimumLineSpacing = 0
        layoutCollectionViewWithTrainers.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layoutCollectionViewWithTrainers.minimumLineSpacing = 0
        collectionViewTourneyWithFriends.setCollectionViewLayout(layoutCollectionViewWithFriends, animated: true)
        collectionViewTourneyWithTrainers.setCollectionViewLayout(layoutCollectionViewWithTrainers, animated: true)
        
        tap.cancelsTouchesInView = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of collection view tourneys
        constraintCollectionViewTourneyWithFriendsHeight.constant = collectionViewTourneyWithFriends.contentSize.height
        constraintCollectionViewTourneyWithTrainers.constant = collectionViewTourneyWithTrainers.contentSize.height
    }
    
    func backMethod() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func dismissKeyboard() {
        searchBar.resignFirstResponder()
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
        if collectionView == collectionViewTourneyWithFriends {
            return nameOfTourneysWithFriends.count
        } else {
            return nameOfTourneysWithTrainers.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewTourneyWithFriends {
            let reuseIdentifier = "browseTourneysWithFriends"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BrowseTourneyWithFriendsCollectionViewCell
            cell.labelNameOfTourneyWithFriends.text = nameOfTourneysWithFriends[indexPath.row]
            cell.labelMoney.text = "\(moneyTourneyWithFriends[indexPath.row]) Up for Grabs"
            cell.labelDays.text = "Starts in \(daysTourneyWithFriends[indexPath.row]) Days"
            cell.labelFriendsCompeting.text = "\(friendsTourneyWithFriends[indexPath.row]) Friends Competing"
            
            let imageViewBackground = cropImage(UIImage(named:"\(backgroundCellImages[indexPath.row])")!, cellHeight: collectionView.frame.height)
            imageViewBackground.contentMode = UIViewContentMode.Center
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageViewBackground)
            
            return cell
        } else {
            let reuseIdentifier = "browseTourneysWithTrainers"
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BrowseTourneyWithTrainersCollectionViewCell
            cell.labelNameOfTourneyWithTrainers.text = nameOfTourneysWithTrainers[indexPath.row]
            cell.labelMoney.text = "\(moneyTourneyWithTrainers[indexPath.row]) Up for Grabs"
            cell.labelDays.text = "Starts in \(daysTourneyWithTrainers[indexPath.row]) Days"
            cell.labelFriendsCompeting.text = "\(friendsTourneyWithTrainers[indexPath.row]) Friends Competing"
            
            let imageViewBackground = cropImage(UIImage(named:"\(backgroundCellImages[indexPath.row])")!, cellHeight: collectionView.frame.height)
            imageViewBackground.contentMode = UIViewContentMode.Center
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageViewBackground)
            
            return cell
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenWidth = UIScreen.mainScreen().bounds.width
        let collectionViewSize = CGSize(width: screenWidth * 0.8, height: collectionView.frame.height)
        return collectionViewSize
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("browseTourney") as! BrowseTourneyViewController
        if collectionView == collectionViewTourneyWithFriends {
            destination.nameOfCurrentTourney = nameOfTourneysWithFriends[indexPath.row]
        } else {
            destination.nameOfCurrentTourney = nameOfTourneysWithTrainers[indexPath.row]
        }
        destination.isItEnabledButtonJoin = true
        destination.isItHiddenCurrentLabel = false
        navigationController?.presentViewController(destination, animated: true, completion: nil)
        
    }
    
    
    func cropImage(image: UIImage, cellHeight: CGFloat) -> UIImageView {
        
        let randomYCoordinate = arc4random_uniform(110)
        let croprect = CGRectMake(0, CGFloat(randomYCoordinate), image.size.width, cellHeight)
        let imageView = UIImageView(frame: croprect)
        imageView.image = image
        return imageView
    }

}
