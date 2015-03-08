//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
//    let items = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let item = self.items[indexPath.row]
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
//  Springs and Struts way
//        cell?.textLabel?.backgroundColor = UIColor.greenColor()
//        cell?.textLabel?.textAlignment = .Center
//        cell?.textLabel?.text = "Row \(item)"
        
        /* TODO:
        The table view cells on this screen are blank.
        
        Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
        */
        
        var stringAtTableRow = "Row \(indexPath.row)"
        
        var greenLabel = UILabel()
        
        greenLabel.text = stringAtTableRow
        greenLabel.textAlignment = .Center
        greenLabel.backgroundColor = UIColor.greenColor()
        greenLabel.layer.cornerRadius = 5
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenLabel.layer.borderColor = UIColor.blackColor().CGColor
        greenLabel.layer.borderWidth = 1
        
        cell?.contentView.addSubview(greenLabel)
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .CenterX, relatedBy: .Equal, toItem: cell?.contentView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .CenterY, relatedBy: .Equal, toItem: cell?.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 120))
        
        
        return cell!
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
