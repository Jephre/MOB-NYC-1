//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
        // the ?? is a nil coalescing operator that unwraps an optional (the first one) if it contains a value OR returns a default value (exerciseView.frame.minY in this case) if the first optional is nil.
        let widthSize: CGFloat = 20
        let heightSize: CGFloat = 20
        
        var blueSquareLeftTop = UIView(frame: CGRect(x: 0, y: navBarHeight, width: widthSize, height: heightSize))
        blueSquareLeftTop.backgroundColor = UIColor.blueColor()
        blueSquareLeftTop.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | .FlexibleRightMargin | .FlexibleTopMargin
        
        var blueSquareRightTop = UIView(frame: CGRect(x: self.view.frame.maxX - widthSize, y: navBarHeight, width: widthSize, height: heightSize))
        blueSquareRightTop.backgroundColor = UIColor.blueColor()
        blueSquareRightTop.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | .FlexibleLeftMargin | .FlexibleTopMargin

        var blueSquareLeftBottom = UIView(frame: CGRect(x: 0, y: self.view.frame.maxY - heightSize - 44, width: widthSize, height: heightSize))
        blueSquareLeftBottom.backgroundColor = UIColor.blueColor()
        blueSquareLeftBottom.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | .FlexibleRightMargin

        var blueSquareRightBottom = UIView(frame: CGRect(x: self.view.frame.maxX - widthSize, y: self.view.frame.maxY - heightSize - 44, width: widthSize, height: heightSize))
        blueSquareRightBottom.backgroundColor = UIColor.blueColor()
        blueSquareRightBottom.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | .FlexibleLeftMargin
        
        
        self.exerciseView.addSubview(blueSquareLeftTop)
        self.exerciseView.addSubview(blueSquareLeftBottom)
        self.exerciseView.addSubview(blueSquareRightTop)
        self.exerciseView.addSubview(blueSquareRightBottom)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
    
    @IBAction func testButton(sender: AnyObject) {

        println(self.view.bounds.size.width)
        println(super.view.bounds.size.height)
    }
}
