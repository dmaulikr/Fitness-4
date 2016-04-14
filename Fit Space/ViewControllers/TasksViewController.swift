//
//  TasksViewController.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //test data
    let nameOfChallenge = ["Eat a fruit or vegetable","Some other challenge with much longer text","One, two, three, four, One, two, three, four, One, two, three, four, One, two, three, four"]
    let amountOfDays = ["2", "999", "100"]
    let nameOfChallengeForVotes = ["Roger has challenged Andrew result on push up challenge", "One two three vote"]
    let amountOfHours = ["999", "25"]
    let nameOfRule = [""]
    let nameOfFriends = [""]
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableViewTasksTourneyChallenges: UITableView!
    @IBOutlet weak var consraintTableViewTasksTourneyChallengesHeight: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfChallenges: UILabel!
    
    @IBOutlet weak var tableViewVoteOnChallengeContests: UITableView!
    @IBOutlet weak var constraintTableViewVoteOnChallengeContestsHeight: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfVotes: UILabel!
    
    @IBOutlet weak var tableViewRuleChangeVoteNeeded: UITableView!
    @IBOutlet weak var constraintTableViewRuleChangeVoteNeeded: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfRuleChanges: UILabel!
    
    @IBOutlet weak var tableViewTasksFriendInvites: UITableView!
    @IBOutlet weak var constraintTableViewTasksFriendInvites: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfFriendInvites: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //change navigation item color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 30.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        //logo in navigation item
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "imageLogoWhite"))
        
        labelAmountOfChallenges.text = "\(nameOfChallenge.count)"
        labelAmountOfVotes.text = "\(nameOfChallengeForVotes.count)"
        
        if nameOfRule != [""] {
            labelAmountOfRuleChanges.text = "\(nameOfRule.count)"
        } else {
            labelAmountOfRuleChanges.text = "0"
        }
        
        if nameOfFriends != [""] {
            labelAmountOfFriendInvites.text = "\(nameOfFriends.count)"
        } else {
            labelAmountOfFriendInvites.text = "0"
        }
        
        //dynamic change height of table views
        tableViewTasksTourneyChallenges.estimatedRowHeight = 44.0
        tableViewTasksTourneyChallenges.rowHeight = UITableViewAutomaticDimension
        tableViewVoteOnChallengeContests.estimatedRowHeight = 44.0
        tableViewVoteOnChallengeContests.rowHeight = UITableViewAutomaticDimension
        tableViewRuleChangeVoteNeeded.estimatedRowHeight = 44.0
        tableViewRuleChangeVoteNeeded.rowHeight = UITableViewAutomaticDimension
        tableViewTasksFriendInvites.estimatedRowHeight = 44.0
        tableViewTasksFriendInvites.rowHeight = UITableViewAutomaticDimension
        
        //enable buttons highlight
        scrollView.delaysContentTouches = false
        tableViewTasksTourneyChallenges.delaysContentTouches = false
        tableViewVoteOnChallengeContests.delaysContentTouches = false
        for case let x as UIScrollView in tableViewTasksTourneyChallenges.subviews {
            x.delaysContentTouches = false
        }
        for case let x as UIScrollView in tableViewVoteOnChallengeContests.subviews {
            x.delaysContentTouches = false
        }
        
        //create badges
        tabBarController!.viewControllers![1].tabBarItem.badgeValue = "\(nameOfActiveTourneys.count)"
        tabBarController!.viewControllers![0].tabBarItem.badgeValue = "\(nameOfChallenge.count + nameOfChallengeForVotes.count)"



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view tourneys
        consraintTableViewTasksTourneyChallengesHeight.constant = tableViewTasksTourneyChallenges.contentSize.height
        constraintTableViewVoteOnChallengeContestsHeight.constant = tableViewVoteOnChallengeContests.contentSize.height
        constraintTableViewRuleChangeVoteNeeded.constant = tableViewRuleChangeVoteNeeded.contentSize.height
        constraintTableViewTasksFriendInvites.constant = tableViewTasksFriendInvites.contentSize.height
    }
    
    
    
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == tableViewTasksTourneyChallenges {
            return nameOfChallenge.count
        } else if tableView == tableViewVoteOnChallengeContests {
            return nameOfChallengeForVotes.count
        } else if tableView == tableViewRuleChangeVoteNeeded {
            return nameOfRule.count
        } else {
            return nameOfFriends.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if tableView == tableViewTasksTourneyChallenges {
            let cell = tableView.dequeueReusableCellWithIdentifier("tasksTourneyChallenges")! as! TasksTourneyChallengesTableViewCell
            cell.labelNameOfChallenge.text = nameOfChallenge[indexPath.row]
            cell.labelAmountOfDays.text = amountOfDays[indexPath.row]
            cell.labelDaysLeft.text = "days left"
            cell.buttonAddVideoOrPicture.setTitle("Add video or picture", forState: UIControlState.Normal)
            cell.buttonAddVideoOrPicture.addTarget(self, action: #selector(TasksViewController.addVideoOrPicture(_:)), forControlEvents: .TouchUpInside)
            cell.buttonAddVideoOrPicture.layer.cornerRadius = 15.0
            cell.buttonAddVideoOrPicture.tag = indexPath.row
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        } else if tableView == tableViewVoteOnChallengeContests {
            let cell = tableView.dequeueReusableCellWithIdentifier("tasksVoteOnChallenge")! as! TasksVoteOnChallengeTableViewCell
            cell.labelAmountOfHours.text = amountOfHours[indexPath.row]
            cell.labelHoursLeft.text = "hours left"
            cell.labelNameOfChallenge.text = nameOfChallengeForVotes[indexPath.row]
            cell.buttonViewAndVote.setTitle("View and vote", forState: UIControlState.Normal)
            cell.buttonViewAndVote.addTarget(self, action: #selector(TasksViewController.viewAndVote(_:)), forControlEvents: .TouchUpInside)
            cell.buttonViewAndVote.layer.cornerRadius = 15.0
            cell.buttonViewAndVote.tag = indexPath.row
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        } else if tableView == tableViewRuleChangeVoteNeeded {
            let cell = tableView.dequeueReusableCellWithIdentifier("tasksRuleChangedVoteNeeded")! as! TasksRuleChangeVoteNeededTableViewCell
            if nameOfRule != [""] {
                cell.labelNameOfRule.text = nameOfRule[indexPath.row]
            } else {
                cell.labelNameOfRule.text = "None"
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("tasksFriendInvites")! as! TasksFriendInvitesTableViewCell
            if nameOfFriends != [""] {
                cell.labelNameOfFriendInvite.text = nameOfFriends[indexPath.row]
            } else {
                cell.labelNameOfFriendInvite.text = "None"
            }
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
    func addVideoOrPicture(sender: UIButton){
        let buttonTag = sender.tag
        print("\(buttonTag)")
    }
    
    func viewAndVote(sender: UIButton){
        let buttonTag = sender.tag
        print("\(buttonTag)")
    }

}
