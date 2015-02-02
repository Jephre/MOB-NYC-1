//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {
// if you look at the reference text, UITextFieldDelegate has 7 methods (which can then be referenced by your ModalViewController)
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        
        var count = todoViewController?.todos.count
        
        todoViewController?.todos.append([:])
        if let counts = count {
            todoViewController?.todos[counts]["name"] = textField.text
            todoViewController?.todos[counts]["status"] = statusField.text
        }
        
        todoViewController?.mainLabel.text = "New label title!"
        todoViewController?.mainLabel.backgroundColor = UIColor.blueColor()
        todoViewController?.mainLabel.textColor = UIColor.whiteColor()
        
//        todoViewController?.mainLabel.alpha = 1
// this would make the label visible when the button is tapped
        
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("To-do added!", object: nil)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
        // self refers to current instance (in both before = sign and after = sign)
        // the type of .delegate is the same as the type of self (after the = sign), which is why you can assign self to self.textField.delegate
        // delegate gets called when text field changes in ModalViewController
        // the IB way involves right-clicking the text field, clicking on delegate and dragging to ModalViewController
        var notificationCenter = NSNotificationCenter.defaultCenter()
        // this returns an instance of NSNotificationCenter (NSNC has a method called defaultCenter() that does it)
        // Why would we want to do this? This is a pattern called singleton. Where there really should only be one (e.g. one NotificationCenter)
        // Other singletons include the screen, the device, the app that's running (UIDevice, UIScreen, UIApplication). A class instance that gets an instance of the class (but only ever one of them)
        notificationCenter.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.textField.backgroundColor = UIColor.redColor()
            // This code runs when UIKeyboardDidShowNotification (which is type String) is posted
        }
        // every notification has a string associated with it. So the first parameter is the string. The last parameter is a function that takes in an NSNotification and doesn't return anything. UIKeyboardDidShowNotification is the identifier/name for the notification. Anything that posts the notification with the name UIKeyboardDidShowNotification will call the code.
    }
    
    func textFieldDidBeginEditing(textFieldThatEdited: UITextField) {
        // UITextField is a UIView
        textField.placeholder = "email@domain.com"
    }
    // textFieldThatEdited points to textField (the variable defined outside the class b/c textField as a local variable was never declared INSIDE the function) - it's not necessary to change the name of the parameter variable AT ALL - it's just a variable that get created when the function forms.
    // when I click on the text field now, the placeholder text changes in the textField.
    // try using breakpoints to stop the app IF the desired part of your app runs (e.g. a function like up top)
    // use of the breakpoints allows us to see what "self"'s properties are. It has UIViewController, textField, todoViewController. (see below left box)
    // the textField in the  function refers to the parameter textField in the function.
    // There's an instance textField AND a parameter textField

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

