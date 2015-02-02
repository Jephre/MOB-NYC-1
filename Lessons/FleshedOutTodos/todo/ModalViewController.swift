//
//  ViewController.swift
//  todo
//
//  Created by Jeffrey Lee on 1/21/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var dueDateField: UITextField!
    
    var todosToAddTo: MainViewController?
//     variable for communication between MainViewController and ModalViewController
    
    @IBAction func didTapButton(sender: AnyObject) {
        var newTask = [0: toDoField.text!, 1: statusField.text!, 2: dueDateField.text!]
        todosToAddTo?.todos.append(newTask)
//        todosToAddTo?.todos.append(textField.text)
        // adds the new input to the list
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if toDoField == dueDateField {
            didTapButton(toDoField)
        }
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

