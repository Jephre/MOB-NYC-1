//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var fibonacciOutput: UILabel!
    
    //What does a class do that a simple var can't do? Do we always need to create a class in order to create a func?

    
    
    // keep on referring to storage variables, try using a func
    
    /* When I click calculate, the number I enter in numberInput should be processed into the fibonacci number corresponding to the index number of numberInput. That fibonacci number then shows up in the fibonacciOutput label.
    */
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
    
    @IBAction func buttonTapped(sender: AnyObject) {
        let adder = FibonacciAdder()
        let fiboResult = adder.fibonacciNumberAtIndex(numberInput.text.toInt())
        fibonacciOutput.text = "Your Fibonacci number is \(fiboResult)."
    }
}
