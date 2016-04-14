//
//  CommentsViewController.swift
//  Fit Space
//
//  Created by bu on 21/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data    
    var isItFromChallenges = Bool()
    let data = Data()
    

    @IBOutlet weak var constraintBottomTableView: NSLayoutConstraint!
    @IBOutlet weak var constraintTableViewCommentsHeight: NSLayoutConstraint!
    @IBOutlet weak var commentsViewControllerNavigation: UINavigationItem!
    
    @IBOutlet weak var viewWithHowMuchLikesThis: UIView!
    
    @IBOutlet weak var tableViewComments: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create bar button
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBack"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(CommentsViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 10, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.commentsViewControllerNavigation.leftBarButtonItem = barButtonBack
        
        viewWithHowMuchLikesThis.layer.borderWidth = 1
        viewWithHowMuchLikesThis.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        //enable button touches
        scrollView.delaysContentTouches = false
        tableViewComments.delaysContentTouches = false
        for case let x as UIScrollView in tableViewComments.subviews {
            x.delaysContentTouches = false
        }
        
        //dynamic change height of table views
        tableViewComments.estimatedRowHeight = 44.0
        tableViewComments.rowHeight = UITableViewAutomaticDimension
        
        //dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CommentsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        //show keyboard under text field
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommentsViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isItFromChallenges {
            return data.tourneysChallengeCommentatorsName.count
        } else {
            return data.tourneysStandingsCommentatorsName.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("commentsCell")! as! CommentsTableViewCell
        
        if isItFromChallenges {
            cell.labelPersonName.text = data.tourneysChallengeCommentatorsName[indexPath.row]
            cell.labelComment.text = data.tourneysChallengeCommentText[indexPath.row]
            cell.imageAvatar.image = UIImage(named: data.tourneysChallengeCommentatorsAvator[indexPath.row])
            
            if data.tourneysChallengeCommentLikes[indexPath.row] == 0 {
                cell.labelAmountLikeButton.text = nil
                cell.imageLikeButton.image = nil
                cell.labelLikeButton.text = "Like"
            } else {
                cell.labelLikeButton.text = "Like  "
                cell.labelAmountLikeButton.text = " \(data.tourneysChallengeCommentLikes[indexPath.row])"
                cell.imageLikeButton.image = UIImage(named: data.tourneysChallengeCommentImagesButton[indexPath.row])
                cell.viewWithLikeButton.backgroundColor = UIColor.whiteColor()
            }
        
        } else {
            cell.labelPersonName.text = data.tourneysStandingsCommentatorsName[indexPath.row]
            cell.labelComment.text = data.tourneysStandingsCommentText[indexPath.row]
            cell.imageAvatar.image = UIImage(named: data.tourneysStandingsCommentatorsAvator[indexPath.row])
            
            if data.tourneysStandingsCommentLikes[indexPath.row] == 0 {
                cell.labelAmountLikeButton.text = nil
                cell.imageLikeButton.image = nil
                cell.labelLikeButton.text = "Like"
            } else {
                cell.labelLikeButton.text = "Like  "
                cell.labelAmountLikeButton.text = " \(data.tourneysStandingsCommentLikes[indexPath.row])"
                cell.imageLikeButton.image = UIImage(named: data.tourneysStandingsCommentImagesButton[indexPath.row])
                cell.viewWithLikeButton.backgroundColor = UIColor.whiteColor()
            }
        }
        
        
        
        cell.viewWithLikeButton.tag = indexPath.row
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CommentsViewController.tapOnLike(_:)))
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
        buttonPost.addTarget(self, action: #selector(CommentsViewController.postCommentMethod), forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(buttonPost)
        return footerView
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        constraintBottomTableView.constant = 0
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.constraintBottomTableView.constant = keyboardFrame.size.height
        })
    }
    
    func postCommentMethod() {
        print("post it!")
    }

    func tapOnLike(sender: UITapGestureRecognizer) {
        let buttonTag = sender.view!.tag
        if isItFromChallenges {
            data.tourneysChallengeCommentLikes[buttonTag] += 1
        } else {
            data.tourneysStandingsCommentLikes[buttonTag] += 1
        }
        tableViewComments.reloadData()
    }
    
}
