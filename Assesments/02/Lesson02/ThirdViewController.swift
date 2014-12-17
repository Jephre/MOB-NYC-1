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
    @IBAction func buttonTapped(sender: AnyObject) {
        if numberField.text.toInt()! % 2 == 0 {
            outputOddEven.text = "The number is even"
        }
        else {
            outputOddEven.text = "The number is odd"
        }
    }
}
