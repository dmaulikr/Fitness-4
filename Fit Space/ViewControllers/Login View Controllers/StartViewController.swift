//
//  StartViewController.swift
//  Fit Space
//
//  Created by bu on 11/03/16.
//  Copyright © 2016 Oleg Shamin. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var labelMainText: UILabel!
    
    @IBOutlet weak var viewPageControl: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    var currentIndex = 0
    
    var labels = [("Complete in fitness competitions for cash or bragging rights AND an amazing physique.","startPage1.png")
        , ("this is your text 2","startPage2.png")
        , ("This is his text 3","startPage3.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGesturetoImageView();
        
        self.pageControl.numberOfPages =  self.labels.count ?? 0
        
        self.pageControl.currentPage = 0;
        changeImage(0);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addGesturetoImageView()       {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(StartViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.viewPageControl.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(StartViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.viewPageControl.addGestureRecognizer(swipeLeft)
    }
    
    func changeImage(index:Int){
        
        let (text,imageName) = self.labels[index];
        self.labelMainText.text = text;
 
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: imageName)?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
        UIGraphicsEndImageContext()
            
        self.viewPageControl.backgroundColor = UIColor(patternImage: image)
    }
    
    @IBAction func changeAdvert(sender: AnyObject) {
        
        if(self.currentIndex > self.pageControl.currentPage)
        {
            changeImage(self.pageControl.currentPage);
            showAminationOnAdvert(kCATransitionFromRight)
        }else if self.currentIndex < self.pageControl.currentPage{
            changeImage(self.pageControl.currentPage);
            showAminationOnAdvert(kCATransitionFromLeft)
        }
        
        self.currentIndex = self.pageControl.currentPage
    }
    
    func showAminationOnAdvert(subtype :String){
        let  transitionAnimation = CATransition();
        transitionAnimation.type = kCATransitionPush;
        transitionAnimation.subtype = subtype;
        
        transitionAnimation.duration = 0.5;
        
        
        transitionAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut);
        transitionAnimation.fillMode = kCAFillModeBoth;
        
        viewPageControl.layer.addAnimation(transitionAnimation, forKey: "fadeAnimation")
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                if(currentIndex > 0) {
                    currentIndex -= 1
                    self.pageControl.currentPage = currentIndex;
                    showAminationOnAdvert(kCATransitionFromLeft);
                }
                changeImage(currentIndex);
                
            case UISwipeGestureRecognizerDirection.Left:
                if(currentIndex < self.labels.count-1) {
                    currentIndex += 1
                    self.pageControl.currentPage = currentIndex;
                    showAminationOnAdvert(kCATransitionFromRight);
                }
                changeImage(currentIndex);
            default:
                break
            }
        }
    }
}
