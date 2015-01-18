//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeBox: UILabel!
    
    @IBOutlet weak var tableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0)
        
        swipeBox.backgroundColor = UIColor(red: 22.0/255.0, green: 160.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        
        swipeBox.textColor = UIColor.whiteColor()
        
        swipeBox.layer.masksToBounds = true
        swipeBox.layer.cornerRadius = 10.0
        swipeBox.textAlignment = NSTextAlignment.Center
       
        tableButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        tableButton.backgroundColor = UIColor(red: 22.0/255.0, green: 160.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        tableButton.layer.masksToBounds = true
        tableButton.layer.cornerRadius = 5.0
//        tableButton.frame = CGRectMake(220.0, 41.0, 150, 50)
    }

    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    
    */
    
    
    /*
    TODO two: Add an imageview to the modal dialog presented in TODO two.

    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */

    @IBAction func didTapDisplayTable(sender: AnyObject) {
        performSegueWithIdentifier("ArrayView", sender: nil)
    }
}

