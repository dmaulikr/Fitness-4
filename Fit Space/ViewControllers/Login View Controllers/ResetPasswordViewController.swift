//
//  ResetPasswordViewController.swift
//  Fit Space
//
//  Created by bu on 11/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonDone(sender: AnyObject) {
        if textFieldPassword.text == textFieldConfirmPassword.text && textFieldPassword.text != "" {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("mainNavigationController")
            self.presentViewController(nextViewController, animated:true, completion:nil)
        } else {
            let alert = UIAlertController(title: "Wrong password", message: "Please enter equal passwords", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

}
