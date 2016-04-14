//
//  SignupViewController.swift
//  Fit Space
//
//  Created by bu on 11/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var buttonSighUpWithFacebook: UIButton!
    @IBOutlet weak var buttonSighUpWithGoogle: UIButton!
    
//    @IBOutlet weak var labelTermsAndPolicy: UILabel!
    
    @IBOutlet weak var textViewTermsAndPolicy: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttonSighUpWithFacebook.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        buttonSighUpWithGoogle.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        let text = "By signing up you agree to our Terms & Privacy Policy"
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(
            string: text,
            attributes: [NSFontAttributeName:
                UIFont(name: "Helvetica", size: 13.0)!, NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        myMutableString.addAttribute(NSLinkAttributeName, value: "http://somelink.com", range: NSRange(location: 31, length: 5))
        myMutableString.addAttribute(NSLinkAttributeName, value: "http://www.policy.com", range: NSRange(location: 39, length: 14))

        textViewTermsAndPolicy.attributedText = myMutableString
        
        textViewTermsAndPolicy.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        print("Url is \(URL)")
        return true
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
