//
//  PlayVideoViewController.swift
//  Fit Space
//
//  Created by bu on 20/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class PlayVideoViewController: UIViewController {

    var personName: String = ""
    var nameOfChallenge: String = ""
    
    @IBOutlet weak var playVideoNavigation: UINavigationItem!
    
    @IBOutlet weak var buttonContestVideo: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewWithComments: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // configure bar buttons and title
        let buttonMore = UIButton()
        buttonMore.setImage(UIImage(named: "buttonMore"), forState: UIControlState.Normal)
        buttonMore.addTarget(self, action:#selector(PlayVideoViewController.moreMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonMore.frame = CGRectMake(0, 0, 16, 20)
        let barButtonMore = UIBarButtonItem(customView: buttonMore)
        self.playVideoNavigation.rightBarButtonItem = barButtonMore
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBackFromPersonsVideo"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(PlayVideoViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 55, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.playVideoNavigation.leftBarButtonItem = barButtonBack
        var navigationTitle = personName.componentsSeparatedByString(" ").first
        navigationTitle?.appendContentsOf("'s Video")
        self.playVideoNavigation.title = navigationTitle
        
        buttonContestVideo.layer.cornerRadius = 15
        
        //enable highlight button
        scrollView.delaysContentTouches = false
        
        viewWithComments.layer.borderWidth = 1
        viewWithComments.layer.borderColor = UIColor.lightGrayColor().CGColor
        
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
    
    @IBAction func buttonContestAVideoPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("contestVideo") as! ContestVideoResultsViewController
        destination.personName = personName
        self.presentViewController(destination, animated: true, completion: nil)
    }

}
