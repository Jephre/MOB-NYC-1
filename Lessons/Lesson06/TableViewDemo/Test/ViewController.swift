//
//  ViewController.swift
//  Test
//
//  Created by Rudd Taylor on 1/14/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

// Table view controller is a scrollable list (just vertically scrollable list of stuff with some things in it). One dimensional, compared with e.g. Photos app which is multidimensional (has horizontal dimension)

// Table views have sections, rows, index paths, and cells. E.g. in contacts app, sections = the letter headers and everything within them, rows = the individual positions of the contact rows within the section. cells = the actual contacts themselves.

// Look into UIGestureRecognizers

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
// the reason why ViewController can have more than one parent class is because these classes aren't actually classes. They're protocols. Protocols DON'T define behavior. They're a grouping of functions and variables and classes that meet the protocol. Functions that meet this protocol have these methods and variables.
    
    let teachers = ["Rudd", "Travis", "Sean"]

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = teachers[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        println("view appeared! Woohoo!")
    }
    
    override func tableview(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}


