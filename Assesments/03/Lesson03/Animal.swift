//
//  Animal.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class Animal: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func prettyAnimalName() -> String {
        return "Animal name: " + self.name
    }
}

/*
TODO five: Create a subclass of the Animal class, add an instance of that object to be displayed in the table view, then change the displayed string of the subclass to your liking. Your subclass should override the function 'prettyAnimalName' (i.e. you should only need to modify the below array, not the table view code)
*/

class Mammal: Animal {
    
}