// Playground - noun: a place where people can play

import UIKit
import Foundation

class Person {
    var name: String
    
    init(theName: String) {
        name = theName
    }
    // this allows there to be any name, not just a default name. However, this also mandates that in order to create an instance of "Person", the Person instance MUST have a name.
    
}

var jeff = Person(theName: "Jeff")
println(jeff.name)
// this one initializes an instance

var jeffTwo = jeff
jeffTwo.name = "Jeffers"
// this was assigns a value to a new variable, and also changes a property value of the new variable subsequently

var rectangle = CGRect(x: 0, y: 0, width: 10, height: 10)
// CGRect is NOT a class. To verify stuff like this, use CMD + right-click on the keyword in question. If it's a struct, it's not a class. Structs can have methods assigned to them, but don't inherit anything. Ints, Arrays, Strings, Shapes (e.g. rectangles), Points (e.g. coordinate points like x and y), are ALL structs. Apple tends to use them for very low-level bundles of objects. We'll be working mostly with classes.

var rectangleCopy = rectangle
rectangleCopy.size.width = 100
// referring to size which is a method that belongs to CGRect. width is a defined parameter/property of CGRect



