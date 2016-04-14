//
//  CurrentChallengeViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class CurrentChallengeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    let nameOfCommentators = ["Andrew Tomson", "Ronald Garcia", "Judy Punk", "Ronald Garcia"]
    let comments = ["Great! Love it!", "Every day of my life...", "Super awesome", "Comment with a lot of words, but it is absolutely meaningless. Synchrophasotron"]
    let hoursAgo = ["1 hour ago", "1 hour ago", "1 hour ago", "23 hours ago"]
    let avatars = ["avatar1", "avatar2", "avatar3", "avatar2"]
    
    var amountOfAllLikesInCurrentChallengeViewController = 0
    var amountOfLikesForEachView = [Int](count: 4, repeatedValue: 0)
    var imagesLikeButton = [String](count: 4, repeatedValue: "imageLikeForButton")
    
    var nameOfChallengeOfCurrentTourney: String = ""
    var nameOfCurrentTourney: String = ""
    var amountOfPoints: String = ""
    
    var isItSubmitedVideo: Bool = true
    
    @IBOutlet weak var currentChallengeNavigation: UINavigationItem!
    @IBOutlet weak var viewWithName: UIView!
    @IBOutlet weak var viewCurrentPosition: UIView!
    @IBOutlet weak var viewTimeLeft: UIView!
    @IBOutlet weak var labelNameOfChallenge: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelNameOfCurrentTourney: UILabel!
    @IBOutlet weak var labelNumberOfPoints: UILabel!
    @IBOutlet weak var buttonSybmitAVideo: UIButton!
    @IBOutlet weak var viewWithComments: UIView!
    @IBOutlet weak var tableViewComments: UITableView!
    @IBOutlet weak var constraintTableViewCommentsHeight: NSLayoutConstraint!
    @IBOutlet weak var viewWithNameOfChallenge: UIView!
    
    @IBOutlet weak var labelComments: UILabel!
    @IBOutlet weak var labelLikes: UILabel!
    
    @IBOutlet weak var labelCurrentPosition: UILabel!
    @IBOutlet weak var labelCurrentPositionText: UILabel!
    @IBOutlet weak var labelVideosSoFar: UILabel!
    @IBOutlet weak var viewWithFinalPosition: UIView!
    @IBOutlet weak var viewWhenEnded: UIView!

    @IBOutlet weak var buttonAllLikes: UIButton!
    @IBOutlet weak var buttonAllComments: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isItActiveTourney {
            viewWithNameOfChallenge.backgroundColor = UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            viewWithFinalPosition.removeFromSuperview()
            viewWhenEnded.removeFromSuperview()
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.showMeResults(_:)))
            viewWithFinalPosition.addGestureRecognizer(tap1)
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.showMeResults(_:)))
            
            viewWithNameOfChallenge.addGestureRecognizer(tap2)
            
        } else {
            viewWithNameOfChallenge.backgroundColor = UIColor(red: 139.0/255.0, green: 139.0/255.0, blue: 139.0/255.0, alpha: 1.0)
            labelVideosSoFar.removeFromSuperview()
            buttonSybmitAVideo.removeFromSuperview()
            viewCurrentPosition.removeFromSuperview()
            viewTimeLeft.removeFromSuperview()
            
            viewWhenEnded.layer.borderWidth = 1
            viewWhenEnded.layer.borderColor = UIColor.lightGrayColor().CGColor
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.showMeResults(_:)))
            viewWithFinalPosition.addGestureRecognizer(tap1)
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.showMeResults(_:)))
            viewWithNameOfChallenge.addGestureRecognizer(tap2)
            
        }
        
        // configure bar buttons
        let buttonMore = UIButton()
        buttonMore.setImage(UIImage(named: "buttonMore"), forState: UIControlState.Normal)
        buttonMore.addTarget(self, action:#selector(CurrentChallengeViewController.moreMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonMore.frame = CGRectMake(0, 0, 16, 20)
        let barButtonMore = UIBarButtonItem(customView: buttonMore)
        self.currentChallengeNavigation.rightBarButtonItem = barButtonMore
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBackFromCurrentChallenge"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(CurrentChallengeViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 77, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.currentChallengeNavigation.leftBarButtonItem = barButtonBack
        
        buttonSybmitAVideo.layer.cornerRadius = 15
        
        viewTimeLeft.layer.borderWidth = 1
        viewTimeLeft.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        viewCurrentPosition.layer.borderWidth = 1
        viewCurrentPosition.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        viewWithComments.layer.borderWidth = 1
        viewWithComments.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        labelNameOfChallenge.text = nameOfChallengeOfCurrentTourney
        labelNameOfCurrentTourney.text = self.nameOfCurrentTourney
        labelNumberOfPoints.text = "\(amountOfPoints) points"
        labelLikes.text = "\(amountOfAllLikesInCurrentChallengeViewController) likes"
        labelComments.text = "\(comments.count) Comments"
        
        if !isItSubmitedVideo {
            labelCurrentPositionText.removeFromSuperview()
            labelCurrentPosition.text = "You have not submited a video yet"
        }
        
        //enable button touches
        scrollView.delaysContentTouches = false
        tableViewComments.delaysContentTouches = false
        for case let x as UIScrollView in tableViewComments.subviews {
            x.delaysContentTouches = false
        }
        
        //dynamic change height of table views
        tableViewComments.estimatedRowHeight = 44.0
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        

        
        let backgroundImages = ["backgroundCell1", "backgroundCell2", "backgroundCell3"]
        let backgroundImagesRandomDigit = arc4random_uniform(UInt32(backgroundImages.count))
        
        viewWithName.backgroundColor = UIColor(patternImage: UIImage(named: "\(backgroundImages[Int(backgroundImagesRandomDigit)])")!)
        
        //dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        //show keyboard under text field
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CurrentChallengeViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view comments
        constraintTableViewCommentsHeight.constant = tableViewComments.contentSize.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moreMethod() {
        print("More button pressed")
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("commentsCell")! as! CurrentChallengeCommentsTableViewCell
        cell.imageAvatar.image = UIImage(named: avatars[indexPath.row])
        cell.labelName.text = nameOfCommentators[indexPath.row]
        cell.labelComment.text = comments[indexPath.row]
        cell.labelHoursAgo.text = hoursAgo[indexPath.row]

        if amountOfLikesForEachView[indexPath.row] == 0 {
            cell.labelAmountLikeButton.text = nil
            cell.imageLikeButton.image = nil
            cell.labelLikeButton.text = "Like"
        } else {
            cell.labelLikeButton.text = "Like  "
            cell.labelAmountLikeButton.text = " \(amountOfLikesForEachView[indexPath.row])"
            cell.imageLikeButton.image = UIImage(named: imagesLikeButton[indexPath.row])
            cell.viewWithLikeButton.backgroundColor = UIColor.whiteColor()
        }
        
        cell.viewWithLikeButton.tag = indexPath.row
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CurrentChallengeViewController.tapOnLike(_:)))
        cell.viewWithLikeButton.addGestureRecognizer(tap)
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        var postCommentTextFieldWidth: CGFloat = 0.0
        switch screenHeight {
        case 480: // 3.5 inch
            postCommentTextFieldWidth = 320.0
        case 568: // 4 inch
            postCommentTextFieldWidth = 320.0
        case 667:
            postCommentTextFieldWidth = 375.0
        default: // rest of screen sizes
            postCommentTextFieldWidth = 414.0
        }
        
        let postCommentTextField = UITextField(frame: CGRectMake(8, 10, postCommentTextFieldWidth - 70, 30))
        postCommentTextField.placeholder = "Write a comment..."
        postCommentTextField.font = UIFont.systemFontOfSize(15)
        postCommentTextField.borderStyle = UITextBorderStyle.RoundedRect
        postCommentTextField.autocorrectionType = UITextAutocorrectionType.No
        postCommentTextField.keyboardType = UIKeyboardType.Default
        postCommentTextField.returnKeyType = UIReturnKeyType.Done
        postCommentTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        postCommentTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        footerView.addSubview(postCommentTextField)
        
        let buttonPost = UIButton(frame: CGRectMake(postCommentTextField.bounds.width + 16, 10,46,30))
        buttonPost.backgroundColor = UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 1.0)
        buttonPost.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        buttonPost.tintColor = UIColor.whiteColor()
        buttonPost.setTitle(" POST ", forState: UIControlState.Normal)
        buttonPost.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        buttonPost.addTarget(self, action: #selector(CurrentChallengeViewController.postCommentMethod), forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(buttonPost)
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    func postCommentMethod() {
        print("post it!")
    }
    
    func tapOnLike(sender: UITapGestureRecognizer) {
        let buttonTag = sender.view!.tag
        amountOfLikesForEachView[buttonTag] += 1
        tableViewComments.reloadData()
        amountOfAllLikesInCurrentChallengeViewController += 1
        labelLikes.text = "\(amountOfAllLikesInCurrentChallengeViewController) likes"   
    }
    
    func showMeResults(sender:UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("resultsOfChallenge") as! ResultsViewController
        destination.nameOfChallenge = nameOfChallengeOfCurrentTourney
        destination.nameOfTourney = nameOfCurrentTourney
        self.presentViewController(destination, animated: true, completion: nil)
    }
    
    @IBAction func buttonSubmitAVideoPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("addVideo") as! AddVideoViewController
        destination.nameOfCurrentChallenge = nameOfChallengeOfCurrentTourney
        self.presentViewController(destination, animated: true, completion: nil)
    }
    
    @IBAction func buttonAllLikesPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("likesViewController") as! LikesViewController
        self.presentViewController(destination, animated: true, completion: nil)
    }
    
    @IBAction func buttonAllCommentsPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("commentsViewController") as! CommentsViewController
        destination.isItFromChallenges = true
        self.presentViewController(destination, animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        let screenHeight = UIScreen.mainScreen().bounds.height
        let scrollPoint : CGPoint = CGPointMake(0, self.mainView.frame.height - screenHeight)
        self.scrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func keyboardWillShow(notification: NSNotification) {

        let screenHeight = UIScreen.mainScreen().bounds.height
        var userInfo = notification.userInfo!
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let scrollPoint : CGPoint = CGPointMake(0, self.mainView.frame.height - screenHeight + keyboardFrame.size.height)
        self.scrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
}
