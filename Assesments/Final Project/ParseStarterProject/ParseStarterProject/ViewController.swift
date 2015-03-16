//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    var backgroundApp = UIView()
    var appInputLabel = UILabel()
    var appInputTextField = UITextField()
    var madeInUSACheckBox = UISwitch()
    var estimateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var object = PFObject(className: "TestObject")
        object.addObject("foo", forKey: "bar")
        object.save()
        
        estimatorUI()
        
    }
    
    func estimatorUI() {
        
        // Set background dimensions and attributes of app first screen
        backgroundApp.setTranslatesAutoresizingMaskIntoConstraints(false)
        backgroundApp.backgroundColor = UIColor.grayColor()
        self.view.addSubview(backgroundApp)
        self.view.addConstraint(NSLayoutConstraint(item: backgroundApp, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: backgroundApp, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: 0))
        
        // set dimensions and attributes of elements on app first screen
        appInputLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        appInputLabel.textColor = UIColor.blackColor()
        
        var usPriceLabel = appInputLabel
        var shippingLabel = appInputLabel
        
        
        
        appInputTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        madeInUSACheckBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        estimateButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

