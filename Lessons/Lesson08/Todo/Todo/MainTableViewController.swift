//
//  MainTableViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var todos = ["groceries", "homework", "walk dog"]
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableViewww: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    // function signature is the combination of its "name" and the parameter names...so the "names" can be the same.

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        // "as" keyword explicitly sets a new type for the variable. In the case above, AnyObject is the default type for dequeue. If there isn't a specific type assigned, AnyObject doesn't have any properties, so there'll be an error.
        
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    // indexPath is a specific location in the table view. It consists of a row and a section. (like x,y)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as ModalViewController
        destination.todoViewController = self
    }
}
