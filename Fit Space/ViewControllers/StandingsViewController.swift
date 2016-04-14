//
//  StandingsViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class StandingsViewController: UIViewController {
    
    //test data
    let nameCompetitorsII = ["Andrew Tomson", "Ronald Garcia", "Judy Punk"]
    let imagesAvatarCompetitorsII = ["avatar1", "avatar2", "avatar3"]
    let amountOfPointsCompetitorsII = ["10 points", "8 points", "7 points"]
    
    let nameCompetitorsI = ["Judy Punk", "Ronald Garcia", "Andrew Tomson"]
    let imagesAvatarCompetitorsI = ["avatar3", "avatar2", "avatar1"]
    let amountOfPointsCompetitorsI = ["9 points", "5 points", "3 points"]
    
    let nameCommentatorII = ["Andrew Tomson"]
    let imagesAvatarCommentatorII = ["avatar1"]
    let commentsII = ["Great! Love it!"]
    let hoursAgoII = ["2 hours ago"]
    
    let nameCommentatorI = ["Ronald Garcia"]
    let imagesAvatarCommentatorI = ["avatar2"]
    let commentsI = ["Nice work!"]
    let hoursAgoI = ["1 hour ago"]
    
    var amountOfLikesForEachViewII = [Int](count: 1, repeatedValue: 0)
    var imagesLikeButtonII = [String](count: 1, repeatedValue: "imageLikeForButton")
    var amountOfLikesForEachViewI = [Int](count: 1, repeatedValue: 0)
    var imagesLikeButtonI = [String](count: 1, repeatedValue: "imageLikeForButton")
    
    
    @IBOutlet weak var labelDescriptionII: UILabel!
    @IBOutlet weak var labelDateII: UILabel!
    @IBOutlet weak var labelDescriptionI: UILabel!
    @IBOutlet weak var labelDateI: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableViewCompetitorsAfterIChallenge: UITableView!
    @IBOutlet weak var constraintTableViewCompetitorsIHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewCommentsAfterIChallenge: UITableView!
    @IBOutlet weak var constraintTableViewCommentsIHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewCompetitorsAfterIIChallenge: UITableView!
    @IBOutlet weak var constraintTableViewCompetitorsIIHeight: NSLayoutConstraint!

    @IBOutlet weak var tableViewCommentsAfterIIChallenge: UITableView!
    @IBOutlet weak var constraintTableViewCommentsIIHeight: NSLayoutConstraint!

    
    @IBOutlet weak var viewWithCommentsI: UIView!
    @IBOutlet weak var buttonSeeOtherCompetitorsI: UIButton!
    @IBOutlet weak var viewWithCommentsII: UIView!
    @IBOutlet weak var buttonSeeOtherCompetitorsII: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        switch screenHeight {
        case 480: // 3.5 inch
            labelDescriptionII.font = UIFont(name: "Helvetica", size: 12)
            labelDateII.font = UIFont(name: "Helvetica", size: 12)
            labelDescriptionI.font = UIFont(name: "Helvetica", size: 12)
            labelDateI.font = UIFont(name: "Helvetica", size: 12)
        case 568: // 4 inch
            labelDescriptionII.font = UIFont(name: "Helvetica", size: 12)
            labelDateII.font = UIFont(name: "Helvetica", size: 12)
            labelDescriptionI.font = UIFont(name: "Helvetica", size: 12)
            labelDateI.font = UIFont(name: "Helvetica", size: 12)
        default: // rest of screen sizes
            labelDescriptionII.font = UIFont(name: "Helvetica", size: 16)
            labelDateII.font = UIFont(name: "Helvetica", size: 16)
            labelDescriptionI.font = UIFont(name: "Helvetica", size: 16)
            labelDateI.font = UIFont(name: "Helvetica", size: 16)
        }
        
        buttonSeeOtherCompetitorsI.layer.cornerRadius = 15
        buttonSeeOtherCompetitorsII.layer.cornerRadius = 15

        viewWithCommentsI.layer.borderWidth = 1
        viewWithCommentsI.layer.borderColor = UIColor.lightGrayColor().CGColor
        viewWithCommentsII.layer.borderWidth = 1
        viewWithCommentsII.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        //enable button touches
        scrollView.delaysContentTouches = false
        tableViewCompetitorsAfterIChallenge.delaysContentTouches = false
        tableViewCommentsAfterIChallenge.delaysContentTouches = false
        tableViewCompetitorsAfterIIChallenge.delaysContentTouches = false
        tableViewCommentsAfterIIChallenge.delaysContentTouches = false
        for case let x as UIScrollView in tableViewCompetitorsAfterIChallenge.subviews {
            x.delaysContentTouches = false
        }
        for case let x as UIScrollView in tableViewCommentsAfterIChallenge.subviews {
            x.delaysContentTouches = false
        }
        for case let x as UIScrollView in tableViewCompetitorsAfterIIChallenge.subviews {
            x.delaysContentTouches = false
        }
        for case let x as UIScrollView in tableViewCommentsAfterIIChallenge.subviews {
            x.delaysContentTouches = false
        }
        
        //dynamic change height of table views
        tableViewCompetitorsAfterIChallenge.estimatedRowHeight = 44.0
        tableViewCompetitorsAfterIChallenge.rowHeight = UITableViewAutomaticDimension
        tableViewCommentsAfterIChallenge.estimatedRowHeight = 44.0
        tableViewCommentsAfterIChallenge.rowHeight = UITableViewAutomaticDimension
        tableViewCompetitorsAfterIIChallenge.estimatedRowHeight = 44.0
        tableViewCompetitorsAfterIIChallenge.rowHeight = UITableViewAutomaticDimension
        tableViewCommentsAfterIIChallenge.estimatedRowHeight = 44.0
        tableViewCommentsAfterIIChallenge.rowHeight = UITableViewAutomaticDimension

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view 
        constraintTableViewCompetitorsIHeight.constant = tableViewCompetitorsAfterIChallenge.contentSize.height
        constraintTableViewCommentsIHeight.constant = tableViewCommentsAfterIChallenge.contentSize.height
        constraintTableViewCompetitorsIIHeight.constant = tableViewCompetitorsAfterIIChallenge.contentSize.height
        constraintTableViewCommentsIIHeight.constant = tableViewCommentsAfterIIChallenge.contentSize.height
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == tableViewCompetitorsAfterIIChallenge {
            return nameCompetitorsII.count
        } else if tableView == tableViewCommentsAfterIIChallenge {
            return nameCommentatorII.count
        } else if tableView == tableViewCompetitorsAfterIChallenge {
            return nameCompetitorsI.count
        } else {
            return nameCommentatorI.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if tableView == tableViewCompetitorsAfterIIChallenge {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("competitorsComboIICell")! as! StandingsCompetitorsIITableViewCell
            cell.labelName.text = nameCompetitorsII[indexPath.row]
            cell.labelNumberOfPerson.text = "\(indexPath.row + 1)"
            cell.labelPoints.text = amountOfPointsCompetitorsII[indexPath.row]
            cell.imageViewAvatar.image = UIImage(named: imagesAvatarCompetitorsII[indexPath.row])
            return cell
            
        } else if tableView == tableViewCommentsAfterIIChallenge {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("commentsComboIICell")! as! StandingsCommentsIITableViewCell
            cell.labelPersonName.text = nameCommentatorII[indexPath.row]
            cell.labelHoursAgo.text = hoursAgoII[indexPath.row]
            cell.labelComment.text = commentsII[indexPath.row]
            cell.imageAvatar.image = UIImage(named: imagesAvatarCommentatorII[indexPath.row])
            
            if amountOfLikesForEachViewII[indexPath.row] == 0 {
                cell.labelAmountLikeButton.text = nil
                cell.imageLikeButton.image = nil
                cell.labelLikeButton.text = "Like"
            } else {
                cell.labelLikeButton.text = "Like  "
                cell.labelAmountLikeButton.text = " \(amountOfLikesForEachViewII[indexPath.row])"
                cell.imageLikeButton.image = UIImage(named: imagesLikeButtonII[indexPath.row])
                cell.viewWithLikeButton.backgroundColor = UIColor.whiteColor()
            }
            
            
            cell.viewWithLikeButton.tag = indexPath.row
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StandingsViewController.tapOnLikeII(_:)))
            cell.viewWithLikeButton.addGestureRecognizer(tap)
            
            return cell
            
        } else if tableView == tableViewCompetitorsAfterIChallenge {
            let cell = tableView.dequeueReusableCellWithIdentifier("competitorsComboICell")! as! StandingsCompetitorsITableViewCell
            cell.labelName.text = nameCompetitorsI[indexPath.row]
            cell.labelNumberOfPerson.text = "\(indexPath.row + 1)"
            cell.labelPoints.text = amountOfPointsCompetitorsI[indexPath.row]
            cell.imageViewAvatar.image = UIImage(named: imagesAvatarCompetitorsI[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("commentsComboICell")! as! StandingsCommentsITableViewCell
            
            cell.labelPersonName.text = nameCommentatorI[indexPath.row]
            cell.labelHoursAgo.text = hoursAgoI[indexPath.row]
            cell.labelComment.text = commentsI[indexPath.row]
            cell.imageAvatar.image = UIImage(named: imagesAvatarCommentatorI[indexPath.row])
            
            if amountOfLikesForEachViewI[indexPath.row] == 0 {
                cell.labelAmountLikeButton.text = nil
                cell.imageLikeButton.image = nil
                cell.labelLikeButton.text = "Like"
            } else {
                cell.labelLikeButton.text = "Like  "
                cell.labelAmountLikeButton.text = " \(amountOfLikesForEachViewI[indexPath.row])"
                cell.imageLikeButton.image = UIImage(named: imagesLikeButtonI[indexPath.row])
                cell.viewWithLikeButton.backgroundColor = UIColor.whiteColor()
            }
            
            
            cell.viewWithLikeButton.tag = indexPath.row
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StandingsViewController.tapOnLikeI(_:)))
            cell.viewWithLikeButton.addGestureRecognizer(tap)
            return cell
        }
        
    }
    
    func tapOnLikeII(sender: UITapGestureRecognizer) {
        let buttonTag = sender.view!.tag
        amountOfLikesForEachViewII[buttonTag] += 1
        tableViewCommentsAfterIIChallenge.reloadData()
    }

    func tapOnLikeI(sender: UITapGestureRecognizer) {
        let buttonTag = sender.view!.tag
        amountOfLikesForEachViewI[buttonTag] += 1
        tableViewCommentsAfterIChallenge.reloadData()
    }
    
    @IBAction func buttonAllLikesPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("likesViewController") as! LikesViewController
        self.presentViewController(destination, animated: true, completion: nil)
    }
    
    @IBAction func buttonAllCommentsPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("commentsViewController") as! CommentsViewController
        destination.isItFromChallenges = false
        self.presentViewController(destination, animated: true, completion: nil)
    }

}
