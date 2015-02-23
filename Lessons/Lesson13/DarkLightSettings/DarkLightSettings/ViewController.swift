//
//  ViewController.swift
//  DarkLightSettings
//
//  Created by Jeffrey Lee on 2/18/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.backgroundSwitch.addTarget(self, action: "didChangeSwitch", forControlEvents: UIControlEvents.ValueChanged)
        // this is a listener for the switch
        
        self.backgroundSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey("switchIsOn")
        // this takes the key "switchIsOn" and returns the boolean value. By default, the returned boolean value would be false if there's nothing set. This also allows for persistence. HOW???
        didChangeSwitch()
    
        // this is to persistent moderately large things like arrays/dictionaries between app sessions. NSUserDefaults is best used for accents, small bits of data. This is used for storing larger bunches of data.
        if let path = NSBundle.mainBundle().pathForResource("Athletes", ofType: "plist") /* this reads from the disk/system */ {
            var array = NSArray(contentsOfFile: path)
            println(array)
            array?.writeToFile(path, atomically: true)
            // this "writeToFile" actually creates the plist
        }
    }

    func didChangeSwitch() {
        println(self.backgroundSwitch.on)
        // backgroundSwitch, being of type UISwitch, has an on property. "Enabled" is whether the user can interact with it.
        if self.backgroundSwitch.on {
            self.label.font = UIFont.systemFontOfSize(30)
//            NSUserDefaults.standardUserDefaults().setBool(self.backgroundSwitch.on, forKey: "switchIsOn")
            // this allows you to resize the font
        }
        else {
            self.label.font = UIFont.systemFontOfSize(10)
//            NSUserDefaults.standardUserDefaults().setBool(self.backgroundSwitch.on, forKey: "switchIsOn")
        }
        NSUserDefaults.standardUserDefaults().setBool(self.backgroundSwitch.on, forKey: "switchIsOn") // we can just put this outside the if else statement because it doesn't change.

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

