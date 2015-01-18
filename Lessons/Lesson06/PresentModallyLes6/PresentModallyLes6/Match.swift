//
//  Match.swift
//  PresentModallyLes6
//
//  Created by Jeffrey Lee on 1/14/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import Foundation

class Match {
    func playGame() -> String {
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
                return "Good Player Loses!"
            }
            
            if badPlayerHealth == 0 {
                println("Good Player: \(goodPlayerHealth)")
                println("Bad Player: \(badPlayerHealth)")
                return "Bad Player Loses!"
            }
            
        }
        return "Good Game"
    }
}
