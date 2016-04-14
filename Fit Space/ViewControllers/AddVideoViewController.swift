//
//  SubmitAVideoViewController.swift
//  Fit Space
//
//  Created by bu on 20/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class AddVideoViewController: UIViewController {

    var nameOfCurrentChallenge: String = ""
    
    @IBOutlet weak var labelNameOfChallenge: UILabel!
    @IBOutlet weak var submitAVideoNavigation: UINavigationItem!
    @IBOutlet weak var viewWithAddVideoButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNameOfChallenge.text = nameOfCurrentChallenge
        
        //create bar button
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBack"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(AddVideoViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 10, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.submitAVideoNavigation.leftBarButtonItem = barButtonBack
        
        viewWithAddVideoButton.layer.borderWidth = 1
        viewWithAddVideoButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        viewWithAddVideoButton.layer.cornerRadius = 5


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addVideoFromLibrary(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("submitVideo") as! SubmitVideoViewController
        destination.nameOfCurrentChallenge = nameOfCurrentChallenge
        self.presentViewController(destination, animated: true, completion: nil)
    }

}
