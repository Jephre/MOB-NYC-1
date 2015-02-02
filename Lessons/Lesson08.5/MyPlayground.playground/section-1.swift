// Playground - noun: a place where people can play

import UIKit

var mysteryType: String = ""
var anotherMystery: [String] = []
var anotherWayToDefine = Array<String>()
var notSoMuchAMystery = ["foo", "bar"]
anotherMystery.append("woohoo!")
anotherMystery[0]


var yetAnother: [String: String] = [:]
var anotherWayToDefineDict = Dictionary<String, String>()
yetAnother["name"] = "rudd"
yetAnother["name"]
yetAnother["age"]


var veryConfusing: [[String: String]] = []
veryConfusing.append(["hi": "angel!"])

var arrayOfDicts: [[String: String]] = [
    [
        "name": "laundry",
        "date": "today",
        "status": "done"
    ],
    [
        "name": "clean house",
        "date": "tomorrow",
        "status": "not done"
    ]
]

arrayOfDicts[0]















// Arrays
var foo: [String] = []
// the type is an "array of strings". It is empty.

var zing: Array<String> = []
// this is the longform of the "foo" line of code

var bar = ["boooooooooo!"]
// this is also an "array of strings"

// Dicts
var baz: [String: String] = [:]
// the type is a "dictionary of [string:string]"

var bif = ["foo": "bar"]
var ping: Dictionary<String, String> = [:]

foo.append("hey!")

var zoom: [[String: String]] = []

var zoom2: [Dictionary<String, String>] = []
// this is the longform of the above "zoom" code

let todos = [
    [
        "name": "groceries",
        "status": "done",
        "date": "today"
    ],
    [
        "name": "laundry",
        "status": "todo",
        "date": "tomorrow"
    ]
]
// this one is an array of string to string dictionaries

todos[0]
// notice that there's no set order to dictionaries, so even though we referenced the first element of the array, the contents within (the dictionaries) aren't in the specified order

// e.g.
var veryConfusing: [[String: String]] = []
veryConfusing.append(["hi": "angel", "wahoo": "yo"])
// that's how to append to the array of dictionaries (if you want to append two dictionary elements

// class ModalViewController: UIViewController, UITableViewDelegate
// in the above case, Delegate is the protocol, but UIViewController is a superclass. Superclass typically has to go first in the order of listing.



todos[0]
todos[1]

todos[0]["name"]

