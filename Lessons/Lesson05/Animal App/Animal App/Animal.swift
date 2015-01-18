//
//  Animal App File.swift
//  Animal App
//
//  Created by Jeffrey Lee on 1/12/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import Foundation

class Animal: NSObject {
    var species: String?
    var name: String?
    func stringRepresentation() -> String {
        return "The animal is a \(species), its name is \(name)."
    }
    /* the proper way to do an optional check (check to see if a value exists, don't use the ! method)
    func stringRepresentation() -> String {
        if let realName = name {
            if let realSpecies = species {
                return "Species: \(realSpecies), name: \(realName)"
            }
        }
        return "Invalid animal!"
    } 
    
    OR
    
    func stringRepresentation() -> String {
        if let name = self.name {
            if let species = self.species {
                return "Species: \(realSpecies), name: \(realName)"
            }
        }
    return "Invalid animal!"
    }
    */
}

