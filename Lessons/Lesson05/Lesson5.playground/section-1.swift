// Playground - noun: a place where people can play

import UIKit
import Foundation

//class Human {
//    var name: String?
//    // example of instance variable - requires an instance to use, cannot be used on the actual class
//    func sayHello() {
//        println(name)
//    }
//}
//
//var jeff = Human()
//jeff.name = "Whahoo"
//// now we're adding a new value to a variable/property of class Human
//
///* Human.sayHello() would not work b/c name has not been initialized
//*/

var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.purpleColor()


class Animal {
    // var species: String?
    // values that are optional automatically default to nil
    var species: String
    
    init() {
        species = "Amoeba"
    }
    // if we want to get around the error, but with no specified constructors (the things inside the parens)
    
    init(theSpecies: String) {
        species = theSpecies
    }
    // this allows us to get around the error if we've defined a variable without a value and it's not optional.
    
    func prettyPrint() -> String {
        return "Some boring generic species"
    }
    
}


func prettyPrintAnimal(animal: Animal) {
    // animal variable is specified to have type "Animal". So this works not only on types but classes
    println("I love \(animal.species)")
}

var organism = Animal()
organism.species

prettyPrintAnimal(organism)

var fido = Animal(theSpecies: "Dog")
fido.species


class Dog: Animal {
    // this makes Dog a subclass of Animal
    var name: String?
    // var species = "Dog" <- this would throw an error because species already exists from Animal parent class, and "Dog" and String? are different types
    override init() {
        // init swift keyword - init function gets called when a new instance of something is created. The () beside a class name (e.g. Dog) means the same as init().
        // override keyword allows you to ...override
        super.init()
        // like the keyword "self". super refers to the superclass
        species = "Dog"
    }
    
    override func prettyPrint() -> String {
        return "Some exciting dog!"
    }
}

var rover = Dog()
rover.prettyPrint()
rover.name = "Rover"
prettyPrintAnimal(rover)
// because rover is an instance of Dog which is a subclass of Animal, it can be used as a parameter
println(rover.name)
println(rover.species)
// rover, as an instance of Dog, also is a sub-instance of Animal and has access to all the same properties as Animal, including species


class Human {
    var name: String? // alternatively, var name: String = "Jeff"
    var age: Int?
    var gender: String?
    
}

var jeff = Human()
jeff.name = "Jeff"
jeff.age = 28
jeff.gender = "Male"

var sean = Human()
sean.name = "Sean"
sean.gender = "Male"
sean.age = 45





