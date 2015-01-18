//
//  ViewController.swift
//  Animal App
//
//  Created by Jeffrey Lee on 1/12/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    // ViewController is a subclass of UIViewController - you basically inherit all the properties, functions, and values from the parent class. Class inherits its methods and state from superclass, but a class can only have ONE superclass. This is because it would get too messy otherwise having multiple inputs into a single subclass.
    
    @IBOutlet weak var labelCatDog: UILabel!
    // UILabel inherits from UIView. We find this out through opt + click on UILabel to access the documentation. In the "Inherits from:" text, each colon to the right indicates a higher class that the preceding class inherits from e.g. UIView : UIResponder: etc
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func dogButton(sender: AnyObject) {
        var dog = Animal()
        dog.name = "Spot"
        dog.species = "Dog"
        labelCatDog.text = dog.stringRepresentation()
        
        view.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func CatButton(sender: AnyObject) {
        var cat = Animal()
        cat.name = "Waffles"
        cat.species = "Cat"
        labelCatDog.text = cat.stringRepresentation()
    }

}

