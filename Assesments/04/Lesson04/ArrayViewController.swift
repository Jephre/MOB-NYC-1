//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    /*
    TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
    */
    
    var tableView: UITableView = UITableView()
    // initialized an instance of UITableView in the current view controller
    
    var textField: UITextField = UITextField()
    // initialized instance of UITextField in current view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // define textField attributes
        textField.placeholder = "Please enter anything."
        textField.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
        textField.backgroundColor = UIColor.orangeColor()
        textField.borderStyle = UITextBorderStyle.Line
        textField.delegate = self
        // textField (worker) is reporting back to ArrayViewController (manager) on something/anything
        
        tableView.frame = CGRectMake(0, CGRectGetMaxY(textField.frame), self.view.frame.size.width, self.view.frame.size.height)
        // setting the boundaries of the UITableView instance programmatically. The height and width go to full height/width of whichever device uses it.
        
        tableView.delegate = self
        // tableView instance has a variable named delegate.
        // self refers to an instance of the parent class (ArrayViewController).
        // we're assigning this instance of the parent class to the UITableView instance's property "delegate".
        // self is reference to global variables/viewcontrollers. If you have two variables, one global and one local with the same name in a single function, you would use self.variable to distinguish the global one from the local.
        
        tableView.dataSource = self
        // tableView instance has a variable named dataSource. We're allowing the tableView to communicate data with the instance of ArrayViewController.
        
//        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // initialize tableView cells; default style for tablecells doesn't have subtitles.

        self.view.addSubview(textField)
        self.view.addSubview(tableView)
        // adds textField, then tableView on top of the existing view
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        // tells tableview to reload all data for cells that are visible
    }
    
        /*
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
    
    var items: [String] = []
    // set items variable to take an array of strings (currently empty). This helps to get around the problem of defining the variable and not giving it any value (thereby requiring an optional and all that messiness).
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // set # of rows in the section = the number of items in the items array.
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = items[indexPath.row]
        
        return cell!
    }
    // setup the dequeueing process
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    // check to see if row is selecting
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        println(textField.text)
        if textField.text != "" {
            items.append(textField.text)
            tableView.reloadData()
            textField.text = ""
        }
        // if textField isn't empty, then append it to the list and reload the data, AND remove the entered text from the textField
        
        self.view.endEditing(true);
        return true;
        // if editing is finished (when textField is pressed), show the entered text.
    }
    
}

