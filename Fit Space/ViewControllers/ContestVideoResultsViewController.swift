//
//  ContestVideoResultsViewController.swift
//  Fit Space
//
//  Created by bu on 21/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ContestVideoResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    
    //test data
    var reasons = ["At minute 1:58, didn't go down all the way... definitely needs to be penalized"]
    
    var personName: String = ""

    @IBOutlet weak var labelPersonName: UILabel!
    @IBOutlet weak var contestVideoResultNavigation: UINavigationItem!
    
    @IBOutlet weak var tableViewContestReason: UITableView!
    @IBOutlet weak var buttonAddMoreReason: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewContestReasonHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelPersonName.text = personName
        
        //create bar button
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBack"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(ContestVideoResultsViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 10, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.contestVideoResultNavigation.leftBarButtonItem = barButtonBack
        
        //enable highlights button
        scrollView.delaysContentTouches = false
        buttonAddMoreReason.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        //dynamic change height of table views
        tableViewContestReason.estimatedRowHeight = 44.0
        tableViewContestReason.rowHeight = UITableViewAutomaticDimension
        
        //configure button addMoreReason
        buttonAddMoreReason.layer.borderWidth = 1
        buttonAddMoreReason.layer.borderColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0).CGColor
        
        //dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ContestVideoResultsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view tourneys
        tableViewContestReasonHeight.constant = tableViewContestReason.contentSize.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reasons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("contestReason")! as! ContestReasonTableViewCell
        cell.textViewReason.text = reasons[indexPath.row]
        cell.textViewReason.tag = indexPath.row
        return cell
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func addMoreReason(sender: AnyObject) {
        
        tableViewContestReason.beginUpdates()
        reasons.append(" ")
        tableViewContestReason.insertRowsAtIndexPaths([NSIndexPath(forRow: reasons.count - 1, inSection: 0)], withRowAnimation: .Automatic)
        
        tableViewContestReasonHeight.constant = tableViewContestReason.contentSize.height
        tableViewContestReason.endUpdates()
    }
    
    
    @IBAction func submitContestReason(sender: AnyObject) {
        print("submit pressed")
    }
    
    func textViewDidChange(textView: UITextView) {
        tableViewContestReason.beginUpdates()
        reasons[textView.tag] = textView.text
        tableViewContestReasonHeight.constant = tableViewContestReason.contentSize.height
        tableViewContestReason.endUpdates()
    }
    
}
