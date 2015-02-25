//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {

    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    
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
        self.scrollView.contentSize = CGSize(width: self.scrollView.bounds.size.width, height: 2000)
        scrollView.scrollEnabled = true
        scrollView.backgroundColor = UIColor.redColor()
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
        self.scrollView.addSubview(redBox)
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
