//
//  MainViewController.swift
//  todo
//
//  Created by Jeffrey Lee on 1/21/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var todos = [[0:"groceries", 1:"completed", 2:"February 1, 2015"], [0: "homework", 1: "in progress", 2: "February 7, 2015"],[0: "walk dog", 1: "not started", 2: "February 25, 2015"]]
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return todos.count
    }
    // function signature is the combination of its "name" and the parameter names...so the "names" can be the same.

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        // "as" keyword explicitly sets a new type for the variable. In the case above, AnyObject is the default type for dequeue. If there isn't a specific type assigned, AnyObject doesn't have any properties, so there'll be an error.
        if let taskName = todos[indexPath.row][0] {
            cell.textLabel?.text = taskName
        }
        
        if let taskStatus = todos[indexPath.row][1] {
            if let taskDueDate = todos[indexPath.row][2] {
                cell.detailTextLabel?.text = taskStatus + " / Due: " + taskDueDate
            }
        }
        return cell
    }

        // indexPath.row
        // indexPath.section (it's a mashup of both row and section)
        
        // Configure the cell...
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = todos[indexPath.row]
//        case 1:
//            cell.textLabel?.text = togos[indexPath.row]
//        default:
//            break
//        }

        // the addition of ? is shorthand for
//        if let label = cell.textLabel {
//            label.text = "hey!"
//        }
    // this function here is NECESSARY when showing a tableview...otherwise you'll get a crash. the "reuseIdentifier" identifier must be used as the identifier for the table cells otherwise you'll also get a crash. You're not limited to this exact name, you can name it whatever you want as long as you link it in the dialog box in the right-side menu.

//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return todos[1]
//        case 1:
//            return togos[2]
//        default:
//            return "Unknown"
//        }
//    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as ModalViewController
        destination.todosToAddTo = self
    }


//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the specified item to be editable.
//        return true
//    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            todos.removeAtIndex(indexPath.row)
            // THIS is the line of code that allows you to remove a cell from the tableview without it crashing. This code updates the # of rows so it reconciles with the #ofrows value.
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the item to be re-orderable.
//        return true
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
