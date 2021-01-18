import Cocoa

/// Video 1
//Structs can be given their own variables and constants, and their own functions, then created and used however you want.
//Variables inside structs are called properties, so this is a struct with one property

struct Sport {
    var name: String
}

//
var tennis = Sport(name: "Tennis")
print(tennis.name)

// Made them a variable so you can change the name like a variable.
tennis.name = "Lawn tennis"



/// Video 2  Computed properties
///That has a name property that stores a String. These are called stored properties, because Swift has a different kind of property called a computed property – a property that runs code to figure out its value

struct SPort {
    var name: String
    var isOlympicSport: Bool
// Runs code to figure out the string olympicSport.
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
//As you can see, olympicStatus looks like a regular String, but it returns different values depending on the other properties

let chessBoxing = SPort(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//
