
import UIKit
import Foundation

// difference between structs + classes. Class creates reference, structs make a copy.

//var a = Human(name: "Sans")
//var b = a
//b.name = "SeanTwo"
//println(a.name)
// in this case both var b and a point to the same value. Illustrating a class.

var a = CGPoint(x: 0, y: 0)
var b = a
b.x = 10
println(a.x)

// in this case, the reference is separate, but a copy of the former. Hence, a struct.

// arrays are structs


var c: [Int?] = [1,2,3,nil]
// if there's an array with a nil value ANYWHERE, that would be an array of int optionals

var someInts = [0,1,2,3]
someInts.append(4)
someInts.append(5)
someInts.append(1)
// use .append method to add onto the end of a group of array elements

var someIntsCopy = someInts
someIntsCopy.removeLast()
// .removeLast method removes the last of a group of array elements

someInts
someIntsCopy
// demonstrates that the arrays are a copy, not a reference to each other

someInts.insert(1, atIndex: 1)
// .insert allows for the insertion of an element at a defined index order of the group of array elements

// someInts[10]
// this would crash your app because Swift doesn't know that your array doesn't have a 10th element

someInts.count
// .count method counts how many elements you have in your array

var tester = someInts[1]
// access an array element at a specified index order

for (index, randomVariable) in enumerate(someInts) {
    println("\(randomVariable) \(index)")
}
// (index, randomVariable) is a tuple. They represent two Ints. Enumerate returns an array of tuples. Enumerate transforms the array into another form of array.

for someInt in someInts {
    println(someInt)
}

var names = ["Jeff", "Mims", "Kenny"]
for name in names {
    println(name)
}

for (index, name) in enumerate(names) {
    println("\(index) \(name)")
}

var confusing: [Int?] = [0,1,2,nil]
println(confusing[1])
// need to check if optional exists using "if let"

// CLOSURES

func printFiveTimes(string: String) {
    for i in 0..<5 {
        println(string)
    }
}

printFiveTimes("hey class")

func doFiveTimes(someClosure: () -> ()) {
    for i in 0..<5 {
        // This runs 5 times
        someClosure()
    }
}
// the use of () before and after the -> indicates that the function returns AND accepts nothing. In addition to that, we can set the parameters as the function someClosure, and the "() -> ()" is actually the type of the function. That set of parantheses is actually the equivalent of defining a type (e.g. Int or String) for function.

doFiveTimes({ () -> () in println("this happens five times!")
})
// here we're passing one function println into another doFiveTimes

// DICTIONARIES

var arrayOfInts = [1,2,3]
var firstElement = arrayOfInts[1]

var age: [String: Int] = ["jeff": 28, "ken": 26]

age["kevin"] = 20
age["hello"] = 15
// the above two are maps. Mapping a value to a key in a dictionary. Anytime a value is mapped, it is an optional value.

age["billy"]
// a key without a value results in nil, which is fine!

let jeffsAge = age["jeff"]
let kevinsAge = age["kevin"]

// dictionaries are mapping two things together. Each key has to be unique (e.g. "jeff", where 28 is the value.) Each key has to have one value. Also, dictionaries don't have an order. They're just a collection. Dictionaries are associations between one type and another type.