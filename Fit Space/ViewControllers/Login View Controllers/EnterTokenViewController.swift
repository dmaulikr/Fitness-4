//
//  EnterTokenViewController.swift
//  Fit Space
//
//  Created by bu on 11/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class EnterTokenViewController: UIViewController {

    @IBOutlet weak var textFieldToken: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonNext(sender: AnyObject) {
        if textFieldToken.text != "" {
            let viewController: ResetPasswordViewController = self.storyboard?.instantiateViewControllerWithIdentifier("resetPasswordViewController") as! ResetPasswordViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Wrong Token", message: "Please enter valid token", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
