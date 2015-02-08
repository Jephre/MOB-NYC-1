//
//  ViewController.swift
//  smile
//
//  Created by Jeffrey Lee on 2/4/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // SPRINGS AND STRUCTS EXAMPLE
        let topMargin: CGFloat = 50
        let size: CGFloat = 15
        // give it type CGFloat to avoid running into errors when using it as a property in subsequent frame definitions
        
        var leftEye = UIView(frame: CGRect(x: self.view.frame.size.width/4, y: topMargin, width: size, height: size))
        // divide by four to set it 25% of the way across the entire view
        var rightEye = UIView(frame: CGRect(x: self.view.frame.size.width/4*3, y: topMargin, width: size, height: size))
        // multiply by 0.75 to set it 75% of the way across the entire view
        leftEye.backgroundColor = UIColor.purpleColor()
        rightEye.backgroundColor = UIColor.orangeColor()
        // issue with springs and structs is that when you use CMD + <- or CMD + -> to rotate, everything shifts. To avoid this...
        
        // add autoresizingmasks
        leftEye.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin //| UIViewAutoresizing.FlexibleWidth
        // In this case, we're allowing the right side margin to increase and decrease in size but keep the left side margin the same. For the second half of the "binary OR" statement, this combines numbers. The | only combines numbers, nothing to do with functions.
        rightEye.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin //| UIViewAutoresizing.FlexibleWidth
        
        var nose = UIView(frame: CGRect(x: self.view.frame.size.width*0.5-(size*2/2), y: topMargin*2, width: size*2, height: size))
        nose.backgroundColor = UIColor.blueColor()
        nose.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        var mouth = UIView(frame: CGRect(x: self.view.frame.size.width*0.5-(size*4/2), y: topMargin*3, width: size*4, height: size*4))
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

