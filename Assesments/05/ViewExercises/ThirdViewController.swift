//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0))
        
        
        // navbar lives above a subview, so you can never use navigationController?.navigationBar as the toItem.
        
        var ul = UIView()
        var ur = UIView()
        var ll = UIView()
        var lr = UIView()
        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
        
        for view in [ul, ur, ll, lr] {
            view.backgroundColor = UIColor.blueColor()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.exerciseView.addSubview(view)
            
            let size: CGFloat = 20
            self.exerciseView.addConstraint(NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size))
            
            self.exerciseView.addConstraint(NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size))
            
        }
        // instead of creating each of the views one-by-one, we create them in this loop.
        // our "from" item is "view" as defined in the for loop. The "to" item is nothing b/c we're setting the width value of only one object, not in relation to another view.
        
        for topBoxes in [ul,ur] {
            self.exerciseView.addConstraint(NSLayoutConstraint(item: topBoxes, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1, constant: navBarHeight))
        }
        
        for bottomBoxes in [ll,lr] {
            self.exerciseView.addConstraint(NSLayoutConstraint(item: bottomBoxes, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1, constant: -44))
        }
        
        for leftBoxes in [ul,ll] {
            self.exerciseView.addConstraint(NSLayoutConstraint(item: leftBoxes, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1, constant: 0))
        }
        
        for rightBoxes in [ur,lr] {
            self.exerciseView.addConstraint(NSLayoutConstraint(item: rightBoxes, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1, constant: 0))
        }
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
