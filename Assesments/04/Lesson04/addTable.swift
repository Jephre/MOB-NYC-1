//
//  addTable.swift
//  Lesson04
//
//  Created by Jeffrey Lee on 1/27/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var tableCells = ["Magic", "Hello", "Wahoo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = "Hello World"
        
        return cell
}