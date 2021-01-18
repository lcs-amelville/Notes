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



/// Video 3 Property observers
//Property observers let you run code before or after any property changes

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

//We can now create an instance of that struct and adjust its progress over time
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that.
//You can also use willSet to take action before a property changes, but that is rarely used



/// Video 4
//Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

//That method belongs to the struct, so we call it on instances of the struct like this
let london = City(population: 9_000_000)
london.collectTaxes()



/// Video 5


