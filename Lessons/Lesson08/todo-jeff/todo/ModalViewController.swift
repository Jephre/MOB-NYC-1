//
//  ViewController.swift
//  todo
//
//  Created by Jeffrey Lee on 1/21/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var todosToAddTo: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func didTapButton(sender: AnyObject) {
        todosToAddTo?.append(textField.text)
        // adds
        dismissViewControllerAnimated(true, completion: nil)
    }

}

