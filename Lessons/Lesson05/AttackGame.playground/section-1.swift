// Playground - noun: a place where people can play

import UIKit
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




class Match {
    func playGame() -> Int {
        var goodPlayerHealth = GoodPlayer().health
        var badPlayerHealth = BadPlayer().health
        while goodPlayerHealth > 0 || badPlayerHealth > 0 {
        
            var attackOrderPlay1 = arc4random()
            var attackOrderPlay2 = arc4random()
       

            if attackOrderPlay1 > attackOrderPlay2 {
                if GoodPlayer().isAlive() == "Player Alive" && BadPlayer().isAlive() == "Player Alive"{
                    var attackDamage = GoodPlayer().attackOne().1
                    badPlayerHealth = badPlayerHealth - attackDamage
                }
                else {
                    println("Game Over")
                }
            }
            else if attackOrderPlay2 > attackOrderPlay1 {
                if GoodPlayer().isAlive() == "Player Alive" && BadPlayer().isAlive() == "Player Alive"{
                    var attackDamage = BadPlayer().attackOne().1
                    goodPlayerHealth = goodPlayerHealth - attackDamage
                }
                else {
                    println("Game Over")
                }
            }
            
        
        
            if goodPlayerHealth == 0 {
                println("Good Player: \(goodPlayerHealth)")
                println("Bad Player: \(badPlayerHealth)")
                println("Good Player Loses!")
                return goodPlayerHealth
            }
            
            if badPlayerHealth == 0 {
                println("Good Player: \(goodPlayerHealth)")
                println("Bad Player: \(badPlayerHealth)")
                println("Bad Player Loses!")
                return badPlayerHealth
            }

        }
        return 0
    }
}


Match().playGame()






