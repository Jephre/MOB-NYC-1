//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var numberOutput: UILabel!
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
   
    @IBAction func buttonTapped(sender: AnyObject) {
        var outputStorage:Int? = numberOutput.text?.toInt()
        var cumulativeSum = outputStorage! + numberField.text.toInt()!
        numberOutput.text = "\(cumulativeSum)"
    }
    /* Some big questions I had for this:
    1) I declare that the new variable outputStorage has an optional Int type. Why does it have to be optional? Why can't I just declare that my outputStorage HAS to have a value and it HAS to be an Int type?
        UILabel is unwrapped (technicality), so I would need an optional ? when referencing it. Unwrapped = you know it's not nil. Same reason for numberOutput
    2) Also, in the outputStorage variable declaration statement, why does numberOutput.text have to be optional?
    3) Previously, I wasn't able to convert numberOutput to an Int type and the error I received said that "String? does not have a member named toInt". Why? I had previously used the following statement:
        numberOutput.text = numberOutput.text.toInt() + numberField.text.toInt()
    By default UILabel! has a String? type. String? doesn't have int
    4) I created a variable cumulativeSum to hold the results of my input and the stored previous label value. Why did I not have to write it like "var cumulativeSum.text" since I'm modifying the value that cumulativeSum has?
    B/c outputStorage is an Int. Because everything is an Int, it infers that cumulativeSum is one too, with no .text property
    5) I added ! to both outputStorage and numberField.text.toInt() in the cumulativeSum variable declaration statement. What does this do and why was it necessary?
    B/c outputStorage and numberOutput are optionals
    6) In previous exercises, I needed to put .text after the variable to show a referenced variable's value in a label. Why didn't I need to do that for cumulativeSum? Also, why don't I need to use a ! to force unwrap the variable to show the value within?
    */
}
