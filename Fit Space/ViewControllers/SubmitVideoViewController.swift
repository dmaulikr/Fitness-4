//
//  SubmitVideoViewController.swift
//  Fit Space
//
//  Created by bu on 21/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class SubmitVideoViewController: UIViewController {

    var nameOfCurrentChallenge: String = ""
    
    @IBOutlet weak var submitVideoNavigation: UINavigationItem!
    @IBOutlet weak var labelNameOfCurrentChallenge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNameOfCurrentChallenge.text = nameOfCurrentChallenge

        //create bar button
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBack"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(SubmitVideoViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 10, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.submitVideoNavigation.leftBarButtonItem = barButtonBack
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
