//
//  MainTableViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    // by citing UITableViewController, we already inherit the protocols UITableViewDelegate and UITableViewDataSource

    @IBOutlet weak var mainLabel: UILabel!
    
    var todos = [
        [
            "name":"groceries",
            "status":"in progress",
            "day": "Feb 7"
        ],
        [
            "name":"laundry",
            "status":"todo",
            "date":"tomorrow"
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.alpha = 0
        // set it to transparent initially
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName("To-do added!", object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.mainLabel.alpha = 1
        }
        // maintableviewcontroller subscribes to the notification that was posted from modalviewcontroller. the name, or first parameter has to be the EXACT same as the name, or first parameter of the posting from the NC of the modal viewcontroller for this notification to send and the code be executed.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as ModalViewController
        destination.todoViewController = self
    }
    // this allows ModalViewController to know what's happening in this file

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = todos[indexPath.row]["name"]
        cell.detailTextLabel?.text = todos[indexPath.row]["status"]
        // the line above actually populates the cells with data
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
    }
    // want to set the cell that corresponds to "indexPath" to the color blue (when selected)
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
