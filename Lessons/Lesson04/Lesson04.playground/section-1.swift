// Playground - noun: a place where people can play
// Lesson 04

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

func printDefault() {
    for counterOne in 1...10 {
        println("Hello World")
    }
}
// I haven't declared counterOne as a variable, why is there no error?
// Any variable created within the curly braces is only visible to elements WITHIN the curly braces

printDefault()
// to call a function (to get it to execute), you just write down the function name with the parantheses afterward

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func lineHitter() {
    for counterTwo in 1...20 {
        println("Hit this line \(counterTwo) times!")
    }
}

lineHitter()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func stringParameter(name: String) {
    println("Hello \(name)!")
}

stringParameter("Jeff")

// Here, we are allowing a new parameter "name" defined by String type to be accepted by our function

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

func stringOptional(nameTwo: String?) {
    // -> () makes it explicit that you are not returning anything when used after the function definition
    // inside the parantheses of the function definition, you can use e.g. (outsideName name: String?) and this will explicitly show the changed labeling
    if let nameTwo = nameTwo {
        // this way, you test whether there's a string or not by testing it versus itself
        println("Hello \(nameTwo)!")
    } else {
        println("Hello world!")
    }
}

stringOptional("Yo")
stringOptional(nil)

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

func returnFibo(n: Int) -> Int {
    var a = 0
    var b = 1
    var c = 1
    if n == 0 {
        return 0
    }
    else if n == 1 {
        return 1
    }
    else {
        for ctr in 2...n {
            c = a + b
            a = b
            b = c
        }
    return c
    }
}

println(returnFibo(25))

//multiple parameters, just use a comma
func helloWorldToTwoPeople(nameThree: String, nameFour: String) {
    println("Hello \(nameThree) and \(nameFour)")
}

helloWorldToTwoPeople("Jeff", "Mims")

// Returning a value, use a little arrow and name the type of thing it returns. It takes some input, and gives back the caller some output. Doesn't print anything out or change a value. Works like a simple function f(x) = 2x where x is the input, and 2 times x is the output. If your function returns a value, it MUST use the keyword "return". The returned value MUST be the same type you specify up top after the arrow.

func formattedHelloWorldTextToName(nameFive: String) -> String {
    return "Hello \(nameFive), have a great class!"
}

println(formattedHelloWorldTextToName("Jeff") + " hahahaha")
// things that are returned can be included in other functions etc. It's how you store values.
var formattedText = formattedHelloWorldTextToName("Jeff")
println(formattedText)
// in this case, we're assigning the function's returned value to a variable and then printing it out

func lengthOfNames(nameOne: String, nameTwo: String) -> (Int, Int) {
    return (countElements(nameOne), countElements(nameTwo))
}
println(lengthOfNames("Plucky", "Ducky"))
// in this case, we're returning two Ints instead of one
var lengths = lengthOfNames("Plucky", "Ducky")
println(lengths.0)
println(lengths.1)

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

var sum = 0

func fiboSum() -> Int {
    for blank in 1...20 {
        sum = sum + returnFibo(blank)
        // sum += returnFibo(blank) is equivalent to statement above
    }
    return sum
}

fiboSum()

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

//func numberDetector(n: Int) {
//    if n == 0 || n == 1 {
//        println("It's neither prime nor composite.")
//    }
//    else {
//        var i = 0
//        var isComposite = false
//        // use of booleans instead of Int or other types
//        for i in 2...n-1 {
//            if n % i == 0 {
//                isComposite = true
//                break
//                // return leaves function, break just stops executing the loop
//            }
//        }
//        if !isComposite {
//            println("It's prime.")
//        }
//        else {
//            println("It's composite.")
//        }
//    }
//}
//
//numberDetector(12)

// alternate solution to above
func primeDetector(testNumber: Int) -> String {
    let neither = "neither"
    let prime = "prime"
    let composite = "composite"
    
    //identify exceptional ints, -, 0, 1, 2
    if testNumber <= 1 {
        return neither
    }
    else if testNumber == 2 {
        return prime
    }
    
    // divide testNumber by each number that is smaller than it
    for i in 2...(testNumber - 1) {
        if testNumber % i == 0 {
            return composite
        }
    }
    
    // give result
    return prime
}

let result = primeDetector(5)

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

func printFiboPrime(q: Int) {
    var testNum = 0
    if q < 1 {
        println("This ain't gonna work.")
    }
    else {
        for fiboCtr in 0...q {
        returnFibo(fiboCtr)
        testNum = returnFibo(fiboCtr)
        println("\(testNum) is \(primeDetector(testNum)).")
        }
    }
}

printFiboPrime(20)

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func billTip(bill: Double, tip: Double) -> (Double, Double) {
    var tipAmount = bill * tip
    var totalBill = bill + tipAmount
    return (totalBill, tipAmount)
}

billTip(167,0.2)

//Travis version
func tipCalc(subTotal: Float, tip: Float?) -> (tipResult: Float, tipAmount: Float) {
    var total = subTotal
    var tipAmount: Float = 0
    
    if let t = tip {
        tipAmount = subTotal * t
    }
    
    total += tipAmount
    
    return(total, tipAmount)
}

let tipResult = tipCalc(10, 0.2)
let t = tipResult.0
let tndfjfgb = tipResult.1

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func stringReverser(str1: String) -> String {
    var revStr = String(reverse(str1))
    return revStr + " " + str1
}

stringReverser("Hello, my name is Jeff.")

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func searchTermString([String,String,String]) {
    
}

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.


// Practice from Lesson 5
// Function that prints a random number
import Foundation

func printRandNum() {
    println(rand())
}

printRandNum()

// Function that returns a random number; note, return ends the function. No code after the return line runs
func returnRandNum() -> Int {
    return(Int(rand()))
}

returnRandNum()

// function that takes two numbers and returns their product

func returnProduct(firstNum: Int, secondNum: Int) -> Int {
    return firstNum * secondNum
}

returnProduct(2, 4)

// function that takes two numbers and returns the pair of those #'s multiplied by a random #
func returnRandProduct(firstNumOne: Int, secondNumOne: Int) -> (Int, Int) {
    return (firstNumOne * Int(rand()), secondNumOne * Int(rand()))
}

returnRandProduct(2,3)

// find whether there's the lower-case a is available in the parameter

func foo(str: String) -> Bool {
    for character in str {
        // creating a for loop for strings
        if character == "a" {
            return true
        }
    }
    return false
}

println(foo("hallo"))
println(foo("werd"))

