// Playground - noun: a place where people can play

import UIKit
import Foundation

// Dictionaries are also known as Hashes in other programming languages
// For dictionaries/maps, you need to have the key in order to look up the value
// e.g. "Jeff" -> 25   This is a [String: Int] mapping.
var age: [String: Int] = ["Jeff": 25, "Ken": 22]

age["Jeff"]
age["Mims"]
// for maps/dictionaries, it's fine to not have a mapped value. Not okay for arrays.
// for maps/dictionaries, you CAN'T use tuples as keys.

// CLOSURES review: it's kinda like a one-time use function
// functions are like named closures, closures take parameters and perhaps return something. Functions are a sub-set of closures.

let numbers = [0, 1, 2, 3, 4]

func addTwoInts(i1: Int, i2: Int) -> Int {
    return i1 + i2
}
//

numbers.reduce(0, combine: addTwoInts)
// reduce function allows you to condense arrays. the first parameter is a beginning value (NOT the index value). It's the first thing that gets passed into the function that you have as the 2nd parameter. The seed value. The U represents any type you want. The Int parameter is automatically assigned if the array consists of Ints. Likewise, it would show String if all of them were Strings. second parameter is a closure that takes in 2 things and returns one. The way this function works (with the above parameters), combines the first two elements in the array, then the first two + the third, and so on. In the above case, the function comes in the form of the predefined function before.
// the reduce function can only take in closures that add?


let strings = ["some", "collection", "of", "strings!"]

func takeTwoStrings(s1: String, s2: String) -> String {
    return s1 + " " + s2
}
// if you swap s1 and s2's positions, it'll end up reversing the order of the words that are combined

strings.reduce("SeedValue", combine: takeTwoStrings)

func stringLengths(length: Int, s1: String) -> Int {
    return length + countElements(s1)
}
strings.reduce(0, combine: stringLengths)
// adds the length of each word in the array

let closureConcat = {(s1: String, s2: String) -> String in
    return s1 + s2
}

takeTwoStrings("hi","there")

strings.reduce("", combine: takeTwoStrings)
// if you don't want anything added onto the rest of the things you're combining together through reduction, use a 0 or nothing between the quotation marks
// combine function takes in closures


strings.reduce("SeedValue", combine: {(s1: String, s2: String) -> String in
    return s1 + s2
})
// the above closureConcat example is not a prime example although the one directly above is how closures are typically used
strings.reduce("SeedValue", combine: {(s1, s2) in
    return s1 + s2
})
// you can actually take out the type names and even a specification for return, swift will figure it out

strings.reduce("SeedValue", combine: {
    return $0 + $1
    // those above refer to unnamed first argument and unnamed second argument
})

strings.reduce("SeedValue", combine: +)
// + is a special function that just adds things together
// all 4 of the above do the same thing



