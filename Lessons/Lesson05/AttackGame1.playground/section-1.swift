// Playground - noun: a place where people can play

import UIKit
import Foundation

class Player {
    var health: Int
    
    init() {
        health = 100
    }
}


class GoodPlayer: Player {
    func attackOne() -> (String, Int) {
        var message = "Pow!"
        var damage = 10
        return (message, damage)
    }
    
    func isAlive() -> String {
        if health == 0 {
            return "Player Dead"
        }
        return "Player Alive"
    }
    
}

class BadPlayer: Player {
    func attackOne() -> (String, Int) {
        var message = "Pow!"
        var damage = 10
        return (message, damage)
    }
    
    func isAlive() -> String {
        if health == 0 {
            return "Player Dead"
        }
        return "Player Alive"
    }
    
}

var playerOne = GoodPlayer()
var playerTwo = BadPlayer()

class Match {
    func playGame() {
        
        var attackOrderPlay1 = arc4random()
        var attackOrderPlay2 = arc4random()
        
        if attackOrderPlay1 > attackOrderPlay2 {
            playerOne.attackOne()
            
        }
        else if attackOrderPlay2 > attackOrderPlay1 {
            playerTwo.attackOne()
        }
        
        
    }
}









