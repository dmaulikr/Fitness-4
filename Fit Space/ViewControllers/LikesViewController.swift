//
//  LikesViewController.swift
//  Fit Space
//
//  Created by bu on 21/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    var nameOfPerson = ["Andrew Tomson", "Ronald Garcia", "Judy Punk", "Jonathan Smith", "Caron Cruise", "Patric Baboumian", "Luke Perry"]
    var amountOfFriends = ["17 mutual friends", "2 mutual friends", "1 mutual friend", "10 mutual friends", "1 mutual friends", "10 mutual friends", "10 mutual friends"]
    var imageAvatar = ["avatar1","avatar2","avatar3","avatar1","avatar3","avatar1","avatar2"]

    @IBOutlet weak var tableViewLikes: UITableView!
    @IBOutlet weak var likesViewControllerNavigation: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create bar button
        let buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "buttonBack"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(LikesViewController.backMethod), forControlEvents: UIControlEvents.TouchUpInside)
        buttonBack.frame = CGRectMake(0, 0, 10, 16)
        let barButtonBack = UIBarButtonItem(customView: buttonBack)
        self.likesViewControllerNavigation.leftBarButtonItem = barButtonBack
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backMethod() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfPerson.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("likesCell")! as! LikesTableViewCell
        
        cell.labelPersonName.text = nameOfPerson[indexPath.row]
        cell.labelAmountFriends.text = amountOfFriends[indexPath.row]
        cell.imageAvatar.image = UIImage(named: imageAvatar[indexPath.row])
        
        return cell
    }
    
}
