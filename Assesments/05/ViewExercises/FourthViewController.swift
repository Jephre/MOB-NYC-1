//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    let blueBoxTop = UIView()
    let purpleLabel = UILabel()
    let redBoxBottom = UIView()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build a scroll view that takes up the entire screen.
        
        In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
        
        Use Autolayout.
        
        
        Your view should be in self.exerciseView, not self.view.
        */
        setupScrollView()
        setupContainerView()
        blueBoxCreate()
        //    var scrollWidth = self.exerciseView.frame.width
        //    var scrollHeight = self.toolMinY - self.navMaxY
        
        //        scrollView = UIScrollView(frame: CGRect(x: 0, y: self.navMaxY, width: scrollWidth, height: scrollHeight))
        
        // scrollView needs view with fixed known dimensions
        
        //    scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Width, relatedBy: .Equal, toItem: scrollView, attribute: .Width, multiplier: 1.0, constant: 0))
        //    scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .Equal, toItem: scrollView, attribute: .Height, multiplier: 1.0, constant: 0))
        
        
        //        purpleLabelCreate()
        //        redBoxCreate()
        
        
        //        containerView.addSubview(purpleLabel)
        //        containerView.addSubview(redBoxBottom)
        
        /* this is the springs and struts way
        scrollView.frame = CGRect(x: 0, y: 0, width: self.exerciseView.frame.width, height: 1000)
        self.scrollView.contentSize = CGSize(width: self.scrollView.bounds.size.width, height: 2000)
        scrollView.scrollEnabled = true
        scrollView.backgroundColor = UIColor.greenColor()
        self.exerciseView.addSubview(scrollView)
        
        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
        
        var blueBox = UIView(frame: CGRect(x: 0, y: navBarHeight, width: self.view.bounds.size.width - 20, height: 20))
        blueBox.backgroundColor = UIColor.blueColor()
        blueBox.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        blueBox.center = CGPointMake(scrollView.frame.size.width / 2, navBarHeight)
        self.scrollView.addSubview(blueBox)
        
        var purpleLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(blueBox.frame), width: self.view.bounds.size.width, height: 1400))
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.textColor = UIColor.whiteColor()
        self.scrollView.addSubview(purpleLabel)
        
        var redBox = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(purpleLabel.frame), width: self.view.bounds.size.width - 20, height: 20))
        redBox.backgroundColor = UIColor.redColor()
        redBox.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        redBox.center = CGPointMake(scrollView.frame.size.width / 2, CGRectGetMaxY(purpleLabel.frame))
        self.scrollView.addSubview(redBox) */
        
    }
    
    func setupScrollView() {
        self.exerciseView.addSubview(scrollView)
        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.scrollView.delegate = self
        scrollView.backgroundColor = UIColor.greenColor()
        
        let topC = NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: exerciseView, attribute: .Top, multiplier: 1.0, constant: 0)
        let bottomC = NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: exerciseView, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let leftC = NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: exerciseView, attribute: .Left, multiplier: 1.0, constant: 0)
        
        let rightC = NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: exerciseView, attribute: .Right, multiplier: 1.0, constant: 0)
        
        exerciseView.addConstraints([topC, bottomC, leftC, rightC])
    }
    
    func setupContainerView() {
        containerView.backgroundColor = UIColor.orangeColor()
        containerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(containerView)
        scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Top, relatedBy: .Equal, toItem: scrollView, attribute: .Top, multiplier: 1.0, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Left, relatedBy: .Equal, toItem: scrollView, attribute: .Left, multiplier: 1.0, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Right, relatedBy: .Equal, toItem: scrollView, attribute: .Right, multiplier: 1.0, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Bottom, relatedBy: .Equal, toItem: scrollView, attribute: .Bottom, multiplier: 1.0, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Width, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 2000))
    }
    
    func blueBoxCreate() {
        containerView.addSubview(blueBoxTop)
        
        blueBoxTop.setTranslatesAutoresizingMaskIntoConstraints(false)
        // tells program to not using springs/struts paradigm
        blueBoxTop.backgroundColor = UIColor.blueColor()
        
        //    let topC = NSLayoutConstraint(item: blueBoxTop, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0)
        //    let bottomC = NSLayoutConstraint(item: blueBoxTop, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: 0)
        //
        //    let leftC = NSLayoutConstraint(item: blueBoxTop, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0)
        //
        //    let rightC = NSLayoutConstraint(item: blueBoxTop, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0)
        //
        //    containerView.addConstraints([topC, bottomC, rightC, leftC])
        containerView.addConstraint(NSLayoutConstraint(item: blueBoxTop, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: blueBoxTop, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: blueBoxTop, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: blueBoxTop, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        
    }
    
    //    func purpleLabelCreate() {
    //        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    //        purpleLabel.backgroundColor = UIColor.purpleColor()
    //        purpleLabel.textColor = UIColor.whiteColor()
    //        purpleLabel.text = "Hello, World"
    //        purpleLabel.textAlignment = NSTextAlignment.Center
    //
    //        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Top, relatedBy: .Equal, toItem: blueBoxTop, attribute: .Bottom, multiplier: 1.0, constant: 0))
    //        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0))
    //        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0))
    //        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1000))
    //
    //    }
    //
    //    func redBoxCreate() {
    //        redBoxBottom.setTranslatesAutoresizingMaskIntoConstraints(false)
    //        redBoxBottom.backgroundColor = UIColor.redColor()
    //
    //        containerView.addConstraint(NSLayoutConstraint(item: redBoxBottom, attribute: .Top, relatedBy: .Equal, toItem: purpleLabel, attribute: .Bottom, multiplier: 1.0, constant: 0))
    //        containerView.addConstraint(NSLayoutConstraint(item: redBoxBottom, attribute: .LeftMargin, relatedBy: .Equal, toItem: containerView, attribute: .LeftMargin, multiplier: 1.0, constant: 10))
    //        containerView.addConstraint(NSLayoutConstraint(item: redBoxBottom, attribute: .RightMargin, relatedBy: .Equal, toItem: containerView, attribute: .RightMargin, multiplier: 1.0, constant: -10))
    //        containerView.addConstraint(NSLayoutConstraint(item: redBoxBottom, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20))
    //
    //    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
    }
    
}