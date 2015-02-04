//
//  ViewController.swift
//  ButtonDemo
//
//  Created by Jeffrey Lee on 2/2/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Click me!", forState: UIControlState.Normal)
        
        
    }
    
    func didTapButton() {
        UIView.animateWithDuration(0.1, animations: { () -> Void in self.button.frame.origin.y = self.button.frame.origin.y + 20
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

