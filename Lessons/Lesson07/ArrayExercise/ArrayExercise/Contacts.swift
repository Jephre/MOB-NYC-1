//
//  Contacts.swift
//  ArrayExercise
//
//  Created by Jeffrey Lee on 1/19/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import Foundation

class Contacts: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func prettyAnimalName() -> String {
        return "Contact name: " + self.name
    }
}

class Family: Contacts {
    
}