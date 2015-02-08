//
//  ViewController.swift
//  autoLayoutSmile
//
//  Created by Jeffrey Lee on 2/4/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        autoLayout()
        // run the function below
        
    }
    
    func autoLayout() {
        var leftEye = UIView()
        var rightEye = UIView()
        // DO NOT add a frame. You'll set this later down below.
        
        leftEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        rightEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        // must add this code to prevent non-autolayout resizing
        
        view.addSubview(leftEye)
        view.addSubview(rightEye)
        
        leftEye.backgroundColor = UIColor.redColor()
        
//        view.addConstraint(NSLayoutConstraint(item: leftEye, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0))
        // set position to left side of the screen. Swift is smart enough to detect the type, so you can just type in a method that that type has without the type name. Change the constant to move the item.
        
        view.addConstraint(NSLayoutConstraint(item: leftEye, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 0.5, constant: 0))
        // set position to left quarter of the screen (notice use of multiplier and .CenterX).
        
        view.addConstraint(NSLayoutConstraint(item: leftEye, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0))
        // set top bound
        // enums are like a fixed array of named stuff (e.g. .Top or .Left belong to NSLayoutAttribute)

        view.addConstraint(NSLayoutConstraint(item: leftEye, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0))
        // Set width. no "toItem" here OR attribute because we don't want it to be equal to view's width
        
        view.addConstraint(NSLayoutConstraint(item: leftEye, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0))
        // Set height.
        
        leftEye.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTap"))
        
    }
    
    func didTap() {
        centerY.constant = centerY.constant + 10
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func springsAndStrutsLayout() {

                let topMargin: CGFloat = 50
                let size: CGFloat = 15
                let screenWidth = view.frame.size.width
                let screenHeight = view.frame.size.height
                
                var leftEye = UIView(frame: CGRect(x: screenWidth / 4 - (size / 2), y: topMargin, width: size, height: size))
                var rightEye = UIView(frame: CGRect(x: screenWidth * 0.75 - (size / 2), y: topMargin, width: size, height: size))
                
                leftEye.backgroundColor = UIColor.purpleColor()
                rightEye.backgroundColor = UIColor.orangeColor()
                leftEye.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin
                rightEye.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
                
                let noseWidth = size * 2
                var nose = UIView(frame: CGRect(x: (screenWidth / 2) - (noseWidth / 2), y: topMargin*2, width: noseWidth, height: size))
                nose.backgroundColor = UIColor.blueColor()
                nose.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
                
                let mouthWidth = size * 4
                var mouth = UIView(frame: CGRect(x: (screenWidth / 2) - (mouthWidth / 2), y: topMargin*3, width: mouthWidth, height: mouthWidth))
                mouth.backgroundColor = UIColor.redColor()
                mouth.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
                
                view.addSubview(leftEye)
                view.addSubview(rightEye)
                view.addSubview(nose)
                view.addSubview(mouth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

