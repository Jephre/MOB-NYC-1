//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Jeffrey Lee on 12/16/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FibonacciAdder: NSObject {
    func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int?) -> Int {
            var index = indexOfFibonacciNumber!
            var a = 0
            var b = 1
            var c = 1
        
            if index == 1 {
                return a
            }
            else if index == 2 {
                return b
            }
            else if index <= 0 {
                return a
            }
            else {
                for _ in 3...index {
                // _ can be used as a placeholder for a for variable
                c = a + b
                a = b
                b = c
                }
            }
            return c
        }
}
