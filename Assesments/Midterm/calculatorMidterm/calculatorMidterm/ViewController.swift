//
//  ViewController.swift
//  calculatorMidterm
//
//  Created by Jeffrey Lee on 2/9/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set dimensions of calculator display
        var calculationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        calculationLabel.backgroundColor = UIColor.blackColor()
        calculationLabel.textColor = UIColor.whiteColor()
        
        // set dimensions of keypad area
        var keypadContainer = UIView()
        keypadContainer.setTranslatesAutoresizingMaskIntoConstraints(false)
        keypadContainer.backgroundColor = UIColor.grayColor()
        self.view.addSubview(keypadContainer)
        
        self.view.addConstraint(NSLayoutConstraint(item: keypadContainer, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: keypadContainer, attribute: .Top, relatedBy: .Equal, toItem: calculationLabel, attribute: .Bottom, multiplier: 1.0, constant: 1.0))
        

        
//        class DigitButton = UIButton {
//            self.setTranslatesAutoresizingMaskIntoConstraints(false)
//            self.layer.borderColor = UIColor.blackColor().CGColor
//            self.layer.borderWidth = 2
//            self.backgroundColor = UIColor.whiteColor()
//            
//            let size: CGFloat = 30
//            
//            view.addConstraint(NSLayoutConstraint(item: digitButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size))
//            view.addConstraint(NSLayoutConstraint(item: digitButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size))
//            view.addConstraint(NSLayoutConstraint(item: digitButton, attribute: <#NSLayoutAttribute#>, relatedBy: <#NSLayoutRelation#>, toItem: <#AnyObject?#>, attribute: <#NSLayoutAttribute#>, multiplier: <#CGFloat#>, constant: <#CGFloat#>))
//
//        }
        
        self.view.addSubview(calculationLabel)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

