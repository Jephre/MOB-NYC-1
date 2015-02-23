//
//  ViewController.swift
//  ToDoPersistence
//
//  Created by Jeffrey Lee on 2/18/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var athletes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let maybeAthletes = NSUserDefaults.standardUserDefaults().objectForKey("athletes") as? [String] {
            self.athletes = maybeAthletes
        }
        println(athletes)
        
    }


    @IBAction func didTapButton(sender: AnyObject) {
        athletes = ["Lebron James", "Derek Jeter", "Roberto Luongo", "Sidney Crosby", "Michael Jordan", "Michael Strahan", "Serena Williams", "Maria Sharapova"]
        NSUserDefaults.standardUserDefaults().setObject(athletes, forKey: "athletes")
    }

}

