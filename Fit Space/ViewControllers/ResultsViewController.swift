//
//  ResultsViewController.swift
//  Fit Space
//
//  Created by bu on 19/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    let nameOfPerson = ["Andrew Tomson", "Ronald Garcia", "Andrew Tomson", "Judy Punk"]
    let imagesAvatar = ["avatar1", "avatar2", "avatar1", "avatar3"]
    let resultTime = ["1:25", "1:25", "1:30", "1:40"]
    
    var nameOfChallenge: String = ""
    var nameOfTourney: String = ""

    @IBOutlet weak var resultsViewControllerNavigation: UINavigationItem!
    @IBOutlet weak var labelNameOfChallenge: UILabel!
    @IBOutlet weak var labelNameOfTourney: UILabel!
    @IBOutlet weak var tableViewResult: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var constraintTableViewResultHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // configure bar buttons
        let buttonMore = UIButton()
        buttonMore.setImage(UIImage(named: "buttonMore"), forState: UIControlState.Normal)
        buttonMore.addTarget(self, action:#selector(ResultsViewController.moreMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonMore.frame = CGRectMake(0, 0, 16, 20)
        let barButtonMore = UIBarButtonItem(customView: buttonMore)
        self.resultsViewControllerNavigation.rightBarButtonItem = barButtonMore
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBackFromCurrentChallenge"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(ResultsViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 77, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.resultsViewControllerNavigation.leftBarButtonItem = barButtonBack
        
        labelNameOfChallenge.text = nameOfChallenge
        labelNameOfTourney.text = nameOfTourney
        
        //buttons highlight
        tableViewResult.delaysContentTouches = false
        scrollView.delaysContentTouches = false
        for case let x as UIScrollView in tableViewResult.subviews {
            x.delaysContentTouches = false
        }
        
        //dynamic change height of table views
        tableViewResult.estimatedRowHeight = 44.0
        tableViewResult.rowHeight = UITableViewAutomaticDimension
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view tourneys
        constraintTableViewResultHeight.constant = tableViewResult.contentSize.height
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
        return nameOfPerson.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell")! as! ResultTableViewCell
        
        cell.labelNumberOfPerson.text = ("\(indexPath.row + 1)")
        cell.labelName.text = nameOfPerson[indexPath.row]
        cell.labelTime.text = resultTime[indexPath.row]
        cell.imageViewAvatar.image = UIImage(named: "\(imagesAvatar[indexPath.row])")
        
        cell.viewMain.layer.borderWidth = 1
        cell.viewMain.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        cell.viewWithButtonPlay.layer.borderWidth = 1
        cell.viewWithButtonPlay.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        cell.buttonPlayVideo.tag = indexPath.row
        cell.buttonPlayVideo.addTarget(self, action: #selector(ResultsViewController.buttonPlayVideoPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    func buttonPlayVideoPressed(sender:UIButton) {
        let buttonTag = sender.tag
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("playVideoViewController") as! PlayVideoViewController
        destination.personName = nameOfPerson[buttonTag]
        destination.nameOfChallenge = nameOfChallenge
        self.presentViewController(destination, animated: true, completion: nil)

    }
    
    
    
}
