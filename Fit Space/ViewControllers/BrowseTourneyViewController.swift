//
//  BrowseTourneyViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class BrowseTourneyViewController: UIViewController {

    var nameOfCurrentTourney: String = ""
    var isItEnabledButtonJoin: Bool = Bool()
    var isItHiddenCurrentLabel: Bool = true
    
    @IBOutlet weak var viewWithNameOfTourney: UIView!
    @IBOutlet weak var labelNameOfCurrentTourney: UILabel!
    
    @IBOutlet weak var browseTourneyNavigation: UINavigationItem!
    
    @IBOutlet weak var selector: BrowseTourneySegmentedControl!
    
    @IBOutlet weak var containerViewChallenges: UIView!
    @IBOutlet weak var containerViewStandings: UIView!
    @IBOutlet weak var containerViewUpdates: UIView!
    @IBOutlet weak var containerViewRules: UIView!
    
    @IBOutlet weak var labelCurrentChallenges: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelCurrentChallenges.hidden = isItHiddenCurrentLabel
        
        labelNameOfCurrentTourney.text = nameOfCurrentTourney
        
        nameOfCurrentTourneyForChallenge = nameOfCurrentTourney
        
        isItActiveTourney = isItEnabledButtonJoin
        
        // configure bar buttons
        let buttonJoin = UIButton()
        buttonJoin.setImage(UIImage(named: "buttonJoin"), forState: UIControlState.Normal)
        buttonJoin.addTarget(self, action:#selector(BrowseTourneyViewController.joinMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonJoin.frame = CGRectMake(0, 0, 60, 30)
        let barButtonJoin = UIBarButtonItem(customView: buttonJoin)
        barButtonJoin.enabled = isItEnabledButtonJoin
        let buttonMore = UIButton()
        buttonMore.setImage(UIImage(named: "buttonMore"), forState: UIControlState.Normal)
        buttonMore.addTarget(self, action:#selector(BrowseTourneyViewController.moreMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonMore.frame = CGRectMake(0, 0, 16, 20)
        let barButtonMore = UIBarButtonItem(customView: buttonMore)
        self.browseTourneyNavigation.rightBarButtonItems = [barButtonMore, barButtonJoin]
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBackFromBrowseTourney"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(BrowseTourneyViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 54, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.browseTourneyNavigation.leftBarButtonItem = barButtonBack
        
        
        //configure viewWithName background
        let backgroundImages = ["backgroundCell1", "backgroundCell2", "backgroundCell3"]
        let backgroundImagesRandomDigit = arc4random_uniform(UInt32(backgroundImages.count))
        viewWithNameOfTourney.backgroundColor = UIColor(patternImage: UIImage(named: "\(backgroundImages[Int(backgroundImagesRandomDigit)])")!)
        
        //configure segmented control
        let myElements = ["Challenges"," Standings","  Updates "," Rules    "]
        selector.backgroundColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        selector.cursor = UIImageView(image: UIImage(named: "imageSegmentedControlIndicator"))
        selector.unselectedFont = UIFont(name: "HelveticaNeue-Light", size: 15)
        selector.selectedFont = UIFont(name: "HelveticaNeue-Bold", size: 15)
        selector.unselectedTextColor = UIColor(white: 1, alpha: 0.8)
        selector.unselectedColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        selector.selectedTextColor = UIColor(white: 1, alpha: 1)
        selector.selectedColor = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1)
        selector.cursorPosition = CursorPosition.Bottom
        selector.setItems(myElements)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentValueChanged(sender: AnyObject?){
        
        if selector.selectedIndex() == 0 {
            containerViewChallenges.hidden = false
            containerViewStandings.hidden = true
            containerViewUpdates.hidden = true
            containerViewRules.hidden = true
            labelCurrentChallenges.hidden = isItHiddenCurrentLabel
        } else if selector.selectedIndex() == 1 {
            containerViewChallenges.hidden = true
            containerViewStandings.hidden = false
            containerViewUpdates.hidden = true
            containerViewRules.hidden = true
            labelCurrentChallenges.hidden = true
        } else if selector.selectedIndex() == 2 {
            containerViewChallenges.hidden = true
            containerViewStandings.hidden = true
            containerViewUpdates.hidden = false
            containerViewRules.hidden = true
            labelCurrentChallenges.hidden = true
        } else {
            containerViewChallenges.hidden = true
            containerViewStandings.hidden = true
            containerViewUpdates.hidden = true
            containerViewRules.hidden = false
            labelCurrentChallenges.hidden = true

        }
    }
    
    func joinMethod() {
        print("pressed join")
    }
    
    func moreMethod() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.view.tintColor = UIColor(red: 240.0 / 255.0, green: 60.0 / 255.0, blue: 0.0 / 255.0, alpha: CGFloat(1.0))
        let alertActionSeeRules = UIAlertAction(title: "See Rules", style: UIAlertActionStyle.Default)
            {
                (UIAlertAction) -> Void in
                print("See rules")
        }
        let alertActionProposeRulesChange = UIAlertAction(title: "Propose Rule Change", style: UIAlertActionStyle.Default)
            {
                (UIAlertAction) -> Void in
                print("Propose rules change")
        }
        let alertActionSeeExampleResult = UIAlertAction(title: "See Example Result", style: UIAlertActionStyle.Default)
            {
                (UIAlertAction) -> Void in
                print("See example result")
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
            {
                (UIAlertAction) -> Void in
                print("Cancel")
        }
        alert.addAction(alertActionSeeRules)
        alert.addAction(alertActionProposeRulesChange)
        alert.addAction(alertActionSeeExampleResult)
        alert.addAction(alertActionCancel)
        presentViewController(alert, animated: true)
            {
                () -> Void in
        }
    }
    
    func backMethod() {

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    

}
