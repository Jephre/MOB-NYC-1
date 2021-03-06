//
//  ModalViewController.swift
//  todo-Test
//
//  Created by Jeffrey Lee on 1/24/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var dueDateField: UITextField!
    
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButtonAdd(sender: AnyObject) {
        var newTask = ["name": textField.text!, "status": statusField.text!, "dueDate": dueDateField.text!]
        todoViewController?.tasks.append(newTask)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dueDateField {
            didTapButtonAdd(textField)
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