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
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
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

        notificationCenter.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.keyTextField.backgroundColor = UIColor.blueColor()
            self.valueTextField.backgroundColor = UIColor.blueColor()
            }
        
        notificationCenter.addObserverForName(UIKeyboardDidHideNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.keyTextField.backgroundColor = UIColor.redColor()
            self.valueTextField.backgroundColor = UIColor.redColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    /*
    TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
    TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
    */
    

    
    var itemList: [Dictionary<String, String>] = []
    // declare variable holding all key:value pairs of a dictionary. It's initially set as empty
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    // set number of sections
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    // set number of rows in the single section tableview
    
    // the exclamation mark before keyTextField and valueTextField means "not". Not sure why this is being used. It's asking for a returned value that has type Boolean. This goes back to truthy and falsey values. If keyTextField and valueTextField are NOT empty, and this is true, then this function returns true. This will be important as this function is included in a later function.
    func isValidated() -> Bool {
        return !keyTextField.text.isEmpty && !valueTextField.text.isEmpty
    }
    
    // clears out the textfield when user selects the textfield
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == keyTextField || textField == valueTextField {
            textField.text = nil
        }
//        notificationCenter.postNotificationName("Dictionary added!", object: nil) use this one if you want subscribers to respond to a specific string like "Dictionary added"
    }
    
    /* this function asks the delegate if the text field should process the pressing of the return button. If the return button is pressed, we check if the value of textField is equal to the value of valueTextField AND both keyTextField and valueTextField are filled (not empty). If that's the case, then we tell the textField to relinquish its status as first responder to a touch or motion event (in this case, touch). 
        We test for optionals and simultaneously create a placeholder for our dictionary key:value pair to be added to the tableview by using if let on two new vars "key" and "value". If the value of vars key and value is not nil, then we create a variable called "pair" with dictionary type that uses the values of key and value as its dictionary key, value pair. We add this new variable to the itemList dictionary variable created before using .append, and then reload the tableView.
    */
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField == valueTextField && isValidated() {
            textField.resignFirstResponder()
            if let key = keyTextField.text {
                if let value = valueTextField.text {
                    var pair = ["key": key, "value": value]
                    itemList.append(pair)
                    println(pair)
                    newTableView.reloadData()
                }
            }
        }
//        self.view.endEditing(true);
        return true;
    }

    // this is supposed to show the newly created cell and both key and value of the dictionary...but it's only showing the key. Weird. Fixed it by having it print out the value of pair in string form, pair being the variable that holds the newly appended dictionary key:value pair.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        var pair = itemList[indexPath.row]
        
        cell.textLabel?.text = "\(pair)"
        return cell
    }

    
}
