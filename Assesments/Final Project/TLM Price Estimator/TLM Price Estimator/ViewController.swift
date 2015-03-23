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
    let darkWetAsphalt = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set navigationController title
        self.title = "Tom Lee Music Pricing Estimator"
        
        self.view.backgroundColor = turquoiseColor
        
        priceTextField.delegate = self
        priceTextField.keyboardType = UIKeyboardType.DecimalPad
        
        
        shippingTextField.delegate = self
        shippingTextField.keyboardType = UIKeyboardType.DecimalPad
        
        autoLayout()
    }
    
    func autoLayout() {
        self.view.addSubview(priceTextField)
        priceTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        priceTextField.layer.cornerRadius = 5
        priceTextField.textAlignment = .Center
        priceTextField.backgroundColor = UIColor.whiteColor()
        priceTextField.textColor = UIColor.blackColor()
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Enter in retail price in USD", attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
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
        
        calculateButton.addTarget(self, action: "btnTapped:", forControlEvents: .TouchDown)
        calculateButton.addTarget(self, action: "btnSelected:", forControlEvents: .TouchUpInside)
        calculateButton.addTarget(self, action: "btnReleased:", forControlEvents: .TouchUpOutside)
        
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
    
    func btnTapped(object: UIButton) {
        println("Button tapped")
        calculateButton.backgroundColor = darkWetAsphalt
    }
    
    // this is what happens when the button is touched up inside
    func btnSelected(object: UIButton) {
        println("Button selected")
        calculateButton.backgroundColor = wetAsphalt
        performSegueWithIdentifier("calculateNow", sender: nil)
        
        if priceTextField.text != "" {
            priceTextField.text = ""
        }
        
        if shippingTextField.text != "" {
            shippingTextField.text = ""
        }
        // after submitting via the button, clear textfields.
    }
    
    func btnReleased(object: UIButton) {
        println("Button released")
        calculateButton.backgroundColor = wetAsphalt
    }
    
    //MARK: - Helper Methods
    
    // This is called to remove the first responder for the text field.
    func resign() {
        self.resignFirstResponder()
    }
    
    // This triggers the textFieldDidEndEditing method that has the textField within it.
    //  This then triggers the resign() method to remove the keyboard.
    //  We use this in the "done" button action.
    func endEditingNow(){
        self.view.endEditing(true)
    }
    
    //MARK: - Delegate Methods
    
    // When clicking on the field, use this method.
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        // Create a button bar for the number pad
        let keyboardDoneButtonView = UIToolbar()
        keyboardDoneButtonView.sizeToFit()
        
        // Setup the buttons to be put in the system.
        let item = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Bordered, target: self, action: Selector("endEditingNow") )
        var toolbarButtons = [item]
        
        //Put the buttons into the ToolBar and display the tool bar
        keyboardDoneButtonView.setItems(toolbarButtons, animated: false)
        textField.inputAccessoryView = keyboardDoneButtonView
        
        return true
    }
    
    // What to do when a user finishes editting
    func textFieldDidEndEditing(textField: UITextField) {
        
        //nothing fancy here, just trigger the resign() method to close the keyboard.
        resign()
    }
    
    
    // Clicking away from the keyboard will remove the keyboard.
    override func touchesBegan(touches: (NSSet!), withEvent event: (UIEvent!)) {
        self.view.endEditing(true)
    }
    
    // called when 'return' key pressed. return NO to ignore.
    // Requires having the text fields using the view controller as the delegate.
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        // Sends the keyboard away when pressing the "done" button
        resign()
        return true
        
    }
    
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        var result = true
//        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
//        
//        if textField == priceTextField {
//            if countElements(string) > 0 {
//                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.-").invertedSet
//                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
//                
//                let resultingStringLengthIsLegal = countElements(prospectiveText) <= 8
//                
//                let scanner = NSScanner(string: prospectiveText)
//                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
//                
//                result = replacementStringIsLegal &&
//                    resultingStringLengthIsLegal &&
//                resultingTextIsNumeric
//            }
//        }
//        if textField == shippingTextField {
//            if countElements(string) > 0 {
//                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.-").invertedSet
//                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
//                
//                let resultingStringLengthIsLegal = countElements(prospectiveText) <= 8
//                
//                let scanner = NSScanner(string: prospectiveText)
//                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
//                
//                result = replacementStringIsLegal &&
//                    resultingStringLengthIsLegal &&
//                resultingTextIsNumeric
//            }
//        }
//        
//        return result
//    }
    
    // code that ensures that only 1 decimal point can be inputted into the textfields.s
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        if priceTextField.isFirstResponder() {
            switch string {
            case "0","1","2","3","4","5","6","7","8","9":
                return true
            case ".":
                let array = Array(priceTextField.text)
                var decimalCount = 0
                for character in array {
                    if character == "." {
                        decimalCount++
                    }
                }
            
                if decimalCount == 1 {
                    return false
                } else {
                    return true
                }
            default:
                let array = Array(string)
                if array.count == 0 {
                    return true
                }
            }

        }
        
        if shippingTextField.isFirstResponder() {
            switch string {
            case "0","1","2","3","4","5","6","7","8","9":
                return true
            case ".":
                let array = Array(shippingTextField.text)
                var decimalCount = 0
                for character in array {
                    if character == "." {
                        decimalCount++
                    }
                }
                
                if decimalCount == 1 {
                    return false
                } else {
                    return true
                }
            default:
                let array = Array(string)
                if array.count == 0 {
                    return true
                }
            }
        }
        
    return false
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

