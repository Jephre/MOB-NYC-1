//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var newTableView: UITableView = UITableView()
    
    var keyTextField: UITextField = UITextField()
    var valueTextField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        
        */
        
        keyTextField.placeholder = "Please enter in a key."
        keyTextField.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
        keyTextField.backgroundColor = UIColor.orangeColor()
        keyTextField.borderStyle = UITextBorderStyle.Line
        keyTextField.delegate = self

        valueTextField.placeholder = "Please enter in a value."
        valueTextField.frame = CGRectMake(0, CGRectGetMaxY(keyTextField.frame), self.view.frame.size.width, 50);
        // CGRectGetMaxY is a dynamic way of setting the y position of an object relative to another object.
        valueTextField.backgroundColor = UIColor.orangeColor()
        valueTextField.borderStyle = UITextBorderStyle.Line
        valueTextField.delegate = self
        
        newTableView.frame = CGRectMake(0, CGRectGetMaxY(valueTextField.frame), self.view.frame.size.width, self.view.frame.size.height)
        newTableView.delegate = self
        newTableView.dataSource = self
        newTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(keyTextField)
        self.view.addSubview(valueTextField)
        self.view.addSubview(newTableView)

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.newTableView.reloadData()
        // tells tableview to reload all data for cells that are visible
    }
    
    /*
    TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
    TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
    */
    
    var itemList: [String: String] = [:]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    
        for (key, value) in itemList{
            cell.textLabel?.text = key
            cell.detailTextLabel?.text = value
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
    func textFieldShouldReturn(valueTextField: UITextField!) -> Bool {
        println(valueTextField.text)
        if valueTextField.text != "" {
            itemList["\(keyTextField)"] = "\(valueTextField)"
            newTableView.reloadData()
            valueTextField.text = ""
        }
        
        self.view.endEditing(true);
        return true;
    }


    
}
