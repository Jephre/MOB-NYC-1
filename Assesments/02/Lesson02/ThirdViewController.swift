//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var outputOddEven: UILabel!
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    var numberHolder = 0
    
    @IBAction func buttonTapped(sender: AnyObject) {
//        if numberField.text.toInt() != nil {
//            numberField.text.toInt()! % 2 == 0
//          // the ! would lead to a crash if a nil value exists
//        }
        if let numberHolder = numberField.text.toInt() {
            // if the creation of a constant is equal to the input of the text field, run the if code. If it isn't, run else.
            if numberHolder % 2 == 0 {
                outputOddEven.text = "This is even."
            }
            else {
                outputOddEven.text = "This is odd."
            }
        }
    }
}