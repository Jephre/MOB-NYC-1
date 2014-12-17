// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name = "Jeffrey"
var age = 21

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!")

// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age >= 21 {
    println("You can drink")
}
if age >= 18 {
    println("You can vote")
}
if age >= 16 {
    println("You can drive")
}

// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age >= 16 && age < 18 {
    println("You can drive")
}
else if age >= 18 && age < 21 {
    println("You can drive and vote")
}
else if age >= 21 {
    println("You can drive, vote and drink (but not at the same time!)")
}

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)

var indextwo = 1
while indextwo < 51 {
    let multipleSeven = 7
    println((multipleSeven * indextwo)-1)
    indextwo = indextwo + 1
}

// TODO: Create a constant called number

let number = 3072

// TODO: Print whether the above number is even
//
if number % 2 == 0 {
    println("This number is even")
}
else {
    println("This number is not even!")
}

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var index = 37
var a = 0
var b = 1
var c = 1

if index == 1 {
    println(0)
}
else if index == 2 {
    println(1)
}
else {
    for _ in 3...index {
        // _ can be used as a placeholder for a for variable
        c = a + b
        a = b
        b = c
    }
}
// because you already go through index position 1 and index position 2, you start at position 3 to whatever index number you were looking for

println(c)

//func fib(index:Int) {
//    if index == 0 {
//        return 0
//    }
//    else if index == 1 {
//        return 1
//    }
//    return fib(index - 1) + fib(index - 2)
//}
//
//var a = 0, b = 1, c = 1
//let index = 4
//if index == 0 {
//    return a
//}
//else if index == 1 {
//    return b
//}
//else if index == 2 {
//    return c
//}
//else {
//    for i in 0...index-2 {
//        a = b
//        b = c
//        c = a + b
//    }
//    return c
//}

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

println("Hello \(name), your name is \(countElements(name)) characters long!")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var sum = 0
var randomNum = 0

for counter in 1...100 {
    randomNum = Int(rand())
    // Int() is a function that converts its parameter into an integer type
    sum = sum + randomNum
}

println(sum)

// for vs. while --> for allows you to give a range of times the code will run. while loop might be used more for booleans (as long as a condition is true)
