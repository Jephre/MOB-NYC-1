//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {

    var greenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        autoLayout()
    }
    
    func autoLayout() {
        
        // setup green button
        self.exerciseView.addSubview(greenButton)
        greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.layer.borderColor = UIColor.redColor().CGColor
        greenButton.layer.borderWidth = 3
        greenButton.titleLabel?.text = "Tap me!"
        greenButton.titleLabel?.textColor = UIColor.whiteColor()
        greenButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .CenterX, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .CenterY, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterY, multiplier: 1.0, constant: 0))
    }
    
    // action that occurs when button is tapped
    func buttonAction(sender:UIButton!)
    {
        println("Button tapped")
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
