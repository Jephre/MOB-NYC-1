//
//  ArrayTableView.swift
//  ArrayExercise
//
//  Created by Jeffrey Lee on 1/19/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    var animalArray = [Contacts(name: "Jennifer"), Contacts(name: "Mittens"), Contacts(name: "Ein"), Contacts(name: "Sadie"), Family(name: "Wooster")]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let modalViewController = segue.destinationViewController as ViewController
        modalViewController.tableVC = self
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animalArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        //dequeueReusableCellWithIdentifier allows us to reuse a cell from the table. as? UITableViewCell is a necessary part of this function as the dequeue function returns AnyObject by default and it's necessary to specify something much more specific like the UITableViewCell
        
        cell.textLabel?.text = animalArray[indexPath.row].prettyAnimalName()
        
        return cell
    }
}

