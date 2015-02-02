//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var listNameField: UITextField!
    @IBOutlet weak var textField: UITextField!
    
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        if let todo = todoViewController {
            if let listName = listNameField.text {
                
            }
            todo.todos.append(textField.text)
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

