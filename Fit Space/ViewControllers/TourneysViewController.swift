//
//  TourneysViewController.swift
//  Fit Space
//
//  Created by bu on 17/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

//for badges
let nameOfActiveTourneys = ["Jake Family Tourney","Michael and Friends Tourney","Some other challenge with much longer text"]


class TourneysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //test data
    let moneyUpForGrabs = ["$1,250", "$1.250", "$1"]
    let amountDaysLeft = ["10", "16", "999"]
    let currentPosition = ["1 of 1000", "11 of 1000", "999 of 9999"]
    let nameOfPastTourneys = ["James Franco Tourney"]
    let backgroundCellImages = ["backgroundCell1", "backgroundCell2", "backgroundCell3"]
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableViewActiveTourney: UITableView!
    @IBOutlet weak var constraintTableViewActiveTourneyHeight: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfActiveTourneys: UILabel!

    @IBOutlet weak var tableViewPastTourney: UITableView!
    @IBOutlet weak var constraintTableViewPastTourneyHeight: NSLayoutConstraint!
    @IBOutlet weak var labelAmountOfPastTourneys: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //change navigation item color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 30.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        //logo in navigation item
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "imageLogoWhite"))
        
        //dynamic change height of table views
        tableViewActiveTourney.estimatedRowHeight = 44.0
        tableViewActiveTourney.rowHeight = UITableViewAutomaticDimension
        tableViewPastTourney.estimatedRowHeight = 44.0
        tableViewPastTourney.rowHeight = UITableViewAutomaticDimension
        
        if nameOfActiveTourneys.count == 1 {
            labelAmountOfActiveTourneys.text = "\(nameOfActiveTourneys.count) ACTIVE TOURNEY"
        } else {
            labelAmountOfActiveTourneys.text = "\(nameOfActiveTourneys.count) ACTIVE TOURNEYS"
        }
        
        if nameOfPastTourneys.count == 1 {
            labelAmountOfPastTourneys.text = "\(nameOfPastTourneys.count) PAST TOURNEY"
        } else {
            labelAmountOfPastTourneys.text = "\(nameOfPastTourneys.count) PAST TOURNEYS"
        }
        
        tableViewActiveTourney.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViewPastTourney.separatorStyle = UITableViewCellSeparatorStyle.None
                
    }
    
    override func viewDidAppear(animated: Bool) {
        //hight of table view tourneys
        constraintTableViewActiveTourneyHeight.constant = tableViewActiveTourney.contentSize.height
        constraintTableViewPastTourneyHeight.constant = tableViewPastTourney.contentSize.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewActiveTourney {
            return nameOfActiveTourneys.count
        } else {
            return nameOfPastTourneys.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if tableView == tableViewActiveTourney {
            let cell = tableView.dequeueReusableCellWithIdentifier("activeTourneys")! as! ActiveTourneysTableViewCell
            
            cell.labelNameOfActiveTourney.text = nameOfActiveTourneys[indexPath.row]
            cell.labelCurrentPosition.text = currentPosition[indexPath.row]
            cell.labelAmountDaysLeft.text = amountDaysLeft[indexPath.row]
            cell.labelAmountMoney.text = moneyUpForGrabs[indexPath.row]
            
            let imageViewBackground = cropImage(UIImage(named:"\(backgroundCellImages[indexPath.row])")!, cellHeight: cell.frame.size.height)
            imageViewBackground.contentMode = UIViewContentMode.Center
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageViewBackground)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("pastTourneys")! as! PastTourneyTableViewCell
            cell.labelNameOfPastTourney.text = nameOfPastTourneys[indexPath.row]
            
            let imageViewBackground = cropImage(UIImage(named:"\(backgroundCellImages[indexPath.row])")!, cellHeight: cell.frame.size.height)
            imageViewBackground.contentMode = UIViewContentMode.Center
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageViewBackground)
            
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("browseTourney") as! BrowseTourneyViewController
        if tableView == tableViewActiveTourney {
            destination.nameOfCurrentTourney = nameOfActiveTourneys[indexPath.row]
            destination.isItEnabledButtonJoin = true
            destination.isItHiddenCurrentLabel = false
        } else {
            destination.nameOfCurrentTourney = nameOfPastTourneys[indexPath.row]
            destination.isItEnabledButtonJoin = false
        }
            navigationController?.presentViewController(destination, animated: true, completion: nil)
    }

    
    func cropImage(image: UIImage, cellHeight: CGFloat) -> UIImageView {
        
        let randomYCoordinate = arc4random_uniform(100)
        
        let croprect = CGRectMake(0, CGFloat(randomYCoordinate), image.size.width, cellHeight)
        
        let imageView = UIImageView(frame: croprect)
        imageView.image = image
        
        return imageView
    }


}
