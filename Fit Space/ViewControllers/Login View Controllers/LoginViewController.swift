//
//  LoginViewController.swift
//  Fit Space
//
//  Created by bu on 11/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewWithButtons: UIView!
    @IBOutlet weak var buttonLoginWithFacebook: UIButton!
    @IBOutlet weak var buttonLoginWithGoogle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttonLoginWithFacebook.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        buttonLoginWithGoogle.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
