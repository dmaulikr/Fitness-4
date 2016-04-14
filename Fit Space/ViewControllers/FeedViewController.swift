//
//  FeedViewController.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    let hoursAgo = ["1 hour ago", "2 hours ago", "2 hours ago", "3 hours ago"]
    let weeksAgo = ["", "", "6 weeks ago", ""]
    let lostPounds = ["", "", "Lost 5 pounds", ""]
    let feedback = ["Andrew now in the 1st place of the challenge", "Ronald joined a new tourney", "Ronald updated his progress and has lost weight and is looking better", "Judy did something greate"]
    let now = ["", "", "Now", ""]
    let imagesBefore = ["imagePlaceholder", "imagePlaceholder", "imageResult", "imagePlaceholder"]
    let imagesAfter = ["imagePlaceholder", "imagePlaceholder", "imageResult", "imagePlaceholder"]
    let imagesAvatar = ["avatar1", "avatar2", "avatar2", "avatar3"]

    @IBOutlet weak var tableViewFeed: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //change navigation item color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 30.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        //logo in navigation item
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "imageLogoWhite"))
        
        //dynamic change height of table views
        tableViewFeed.estimatedRowHeight = 44.0
        tableViewFeed.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //feedCell
        let cell = tableView.dequeueReusableCellWithIdentifier("feedCell") as! FeedTableViewCell
        
        cell.labelFeedback.text = feedback[indexPath.row]
        cell.labelHoursAgo.text = hoursAgo[indexPath.row]
        cell.imageViewBefore.image = UIImage(named: imagesBefore[indexPath.row])
        cell.imageViewAfter.image = UIImage(named: imagesAfter[indexPath.row])
        cell.labelLostPounds.text = lostPounds[indexPath.row]
        cell.labelWeeksAgo.text = weeksAgo[indexPath.row]
        cell.labelNow.text = now[indexPath.row]
        cell.imageViewAvatar.image = UIImage(named: imagesAvatar[indexPath.row])
        
        return cell
    }

}
