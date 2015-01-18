//
//  PlayerClass.swift
//  FightClub
//
//  Created by Jeffrey Lee on 1/14/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import Foundation

class Player {
    var health: Int
    
    init(){
        health = 100
    }
    
}

class GoodPlayer: Player {
    
    func isAlive() -> String {
        if health == 0{
            return "Player Dead"
        }
        return "Player Alive"
    }
    
    func attackOne() -> (String, Int){
        var message = "Pow!"
        var damage = 10
        return (message, damage)
    }
    
}

class BadPlayer: Player {
    
    func isAlive() -> String {
        if health == 0{
            return "Player Dead"
        }
        return "Player Alive"
    }
    
    func attackOne() -> (String, Int){
        var message = "Pow!"
        var damage = 10
        return (message, damage)
    }
    
}
