//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var modifiedLabel: UILabel!
    
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var driveLabel: UILabel!
   
    @IBOutlet weak var oneLinerLabel: UILabel!
    
    //TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    /* @IBAction func buttonTapped(sender: AnyObject) {
        modifiedLabel.text = "hello world!"
    } */
    
    //TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        modifiedLabel.text = "Hello \(nameField.text), you are \(ageField.text) years old!"
        drinkRights()
        voteRights()
        driveRights()
        oneLinerAnswer()
    }
    
    //TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    
    func drinkRights() {
        if ageField.text.toInt() > 21 {
            drinkLabel.text = "You can drink"
        }
        else {
            drinkLabel.text = "Sorry, you can't drink"
        }
    }
    
    func voteRights() {
        if ageField.text.toInt() > 18 {
            voteLabel.text = "You can vote"
        }
        else {
            voteLabel.text = "Sorry, you can't vote"
        }
    }
    
    func driveRights() {
        if ageField.text.toInt() > 16 {
            driveLabel.text = "You can drive"
        }
        else {
            driveLabel.text = "Sorry, you can't drive"
        }
    }
    
    //TODO four: Hook up the button to a NEW function (in addition to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    

    func oneLinerAnswer() {
        if ageField.text.toInt() >= 16 && ageField.text.toInt() < 18 {
            oneLinerLabel.text = "You can drive"
        }
        else if ageField.text.toInt() >= 18 && ageField.text.toInt() < 21 {
            oneLinerLabel.text = "You can drive and vote"
        }
        else if ageField.text.toInt() >= 21 {
            oneLinerLabel.text = "You can drive, vote and drink (but not at the same time!)"
            oneLinerLabel.numberOfLines = 0
        }
        else {
            oneLinerLabel.text = "You can't drive, vote, OR drink! Sorry."
        }
    }
    
}
