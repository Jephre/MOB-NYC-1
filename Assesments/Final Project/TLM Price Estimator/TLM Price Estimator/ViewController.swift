//
//  ViewController.swift
//  TLM Price Estimator
//
//  Created by Jeffrey Lee on 3/19/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var priceTextField = UITextField()
    var shippingTextField = UITextField()
    var calculateButton = UIButton()
    
    let turquoiseColor = UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 0.75)
    let greenSeaColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
    let wetAsphalt = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0)
    let carrotColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set navigationController title
        self.title = "Tom Lee Music Pricing Estimator"
        
        self.view.backgroundColor = turquoiseColor
        
        priceTextField.delegate = self
        shippingTextField.delegate = self
        
        autoLayout()
    }
    
    func autoLayout() {
        self.view.addSubview(priceTextField)
        priceTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        priceTextField.layer.cornerRadius = 5
        priceTextField.textAlignment = .Center
        priceTextField.backgroundColor = UIColor.whiteColor()
        priceTextField.textColor = UIColor.blackColor()
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Enter in product price in USD", attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
        self.view.addConstraint(NSLayoutConstraint(item: priceTextField, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: -80))
        self.view.addConstraint(NSLayoutConstraint(item: priceTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: priceTextField, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: priceTextField, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: -100))
        
        self.view.addSubview(shippingTextField)
        shippingTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        shippingTextField.layer.cornerRadius = 5
        shippingTextField.textAlignment = .Center
        shippingTextField.backgroundColor = UIColor.whiteColor()
        shippingTextField.textColor = UIColor.blackColor()
        shippingTextField.attributedPlaceholder = NSAttributedString(string: "Enter in shipping cost in USD", attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
        self.view.addConstraint(NSLayoutConstraint(item: shippingTextField, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: -80))
        self.view.addConstraint(NSLayoutConstraint(item: shippingTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: shippingTextField, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: shippingTextField, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        
        self.view.addSubview(calculateButton)
        calculateButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("Calculate", forState: UIControlState.Normal)
        calculateButton.titleLabel?.textAlignment = .Center
        calculateButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        calculateButton.backgroundColor = wetAsphalt
        calculateButton.titleLabel?.textColor = UIColor.whiteColor()
        
        calculateButton.addTarget(self, action: "btnTouched:", forControlEvents: .TouchUpInside)
        
        self.view.addConstraint(NSLayoutConstraint(item: calculateButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: -80))
        self.view.addConstraint(NSLayoutConstraint(item: calculateButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80))
        self.view.addConstraint(NSLayoutConstraint(item: calculateButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: calculateButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -40))
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "calculateNow") {
            // pass data to next view
            let destinationVC = segue.destinationViewController as ModalViewController
            destinationVC.plhPrice = priceTextField.text
            destinationVC.plhShipping = shippingTextField.text
        }
    }
    
    func btnTouched(object: UIButton) {
        println("Button touched")
//        var st = UIStoryboard(name: "Main", bundle: nil)
//        let vc = st.instantiateViewControllerWithIdentifier("modalPopup") as ModalViewController
//        self.presentViewController(vc, animated: true, completion: nil)
        performSegueWithIdentifier("calculateNow", sender: nil)
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == priceTextField {
            if countElements(string) > 0 {
                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.-").invertedSet
                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
                let resultingStringLengthIsLegal = countElements(prospectiveText) <= 8
                
                let scanner = NSScanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
                
                result = replacementStringIsLegal &&
                    resultingStringLengthIsLegal &&
                resultingTextIsNumeric
            }
        }
        return result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

