//
//  UpdatesViewController.swift
//  Fit Space
//
//  Created by bu on 18/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class UpdatesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    let personName = ["Andrew Tomson", "Ronald Garcia", "Judy Punk", "Ronald Garcia"]
    let comments = ["Great! Love it!", "Every day of my life...", "Super awesome", "Comment with a lot of words, but it is absolutely meaningless. Synchrophasotron"]
    let hoursAgo = ["1 hour ago", "1 hour ago", "1 hour ago", "23 hours ago"]
    let avatars = ["avatar1", "avatar2", "avatar3", "avatar2"]
    let imagesPost = ["imagePost1", "imagePlaceholder", "imagePlaceholder", "imagePost2"]

    @IBOutlet weak var updatesSegmentedControl: UpdatesSegmentedControl!
    
    @IBOutlet weak var constraintTableViewUpdatesHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewUpdates: UITableView!
    @IBOutlet weak var buttonAddPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updatesSegmentedControl.layer.borderColor = UIColor.lightGrayColor().CGColor
        updatesSegmentedControl.layer.borderWidth = 1
        
        //configure segmented control
        let myElements = ["","",""]
        updatesSegmentedControl.selectedColor = UIColor.clearColor()
        updatesSegmentedControl.cursor = UIImageView(image: UIImage(named: "imageSegmentedControlIndicatorUpdates"))
        updatesSegmentedControl.unselectedFont = UIFont(name: "HelveticaNeue-Light", size: 15)
        updatesSegmentedControl.selectedFont = UIFont(name: "HelveticaNeue-Bold", size: 15)
        updatesSegmentedControl.unselectedTextColor = UIColor(white: 1, alpha: 0.8)
        updatesSegmentedControl.selectedColor = UIColor.clearColor()

        updatesSegmentedControl.selectedTextColor = UIColor(white: 1, alpha: 1)
        updatesSegmentedControl.selectedColor = UIColor.clearColor()
        updatesSegmentedControl.cursorPosition = CursorPositionForUpdates.Bottom
        updatesSegmentedControl.setItems(myElements)
        
        buttonAddPhoto.setBackgroundImage(UIImage(named: "buttonPhotoHighlighted"), forState: UIControlState.Highlighted)
        
        //enable button touches
        scrollView.delaysContentTouches = false
        tableViewUpdates.delaysContentTouches = false
        for case let x as UIScrollView in tableViewUpdates.subviews {
            x.delaysContentTouches = false
        }
        
        //dynamic change height of table views
        tableViewUpdates.estimatedRowHeight = 44.0
        tableViewUpdates.rowHeight = UITableViewAutomaticDimension
        
        //dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UpdatesViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view comments
        constraintTableViewUpdatesHeight.constant = tableViewUpdates.contentSize.height
    }
    
    @IBAction func segmentValueChanged(sender: AnyObject?) {
        
        if updatesSegmentedControl.selectedIndex() == 0 {
            print("first")
        } else if updatesSegmentedControl.selectedIndex() == 1 {
            print("second")
        } else {
            print("third")
        }
    }

    @IBAction func buttonAddPhoto(sender: AnyObject) {
        print("add photo pressed")
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("updatesCell")! as! UpdatesTableViewCell
        cell.imageAvatar.image = UIImage(named: avatars[indexPath.row])
        cell.labelPersonName.text = personName[indexPath.row]
        cell.labelComment.text = comments[indexPath.row]
        cell.labelHoursAgo.text = hoursAgo[indexPath.row]
        cell.imagePost.image = UIImage(named: imagesPost[indexPath.row])
        
        return cell
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
