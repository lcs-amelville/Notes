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



/// Video 5   Mutating methods
//If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.

//The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties unless you specifically request it.

//When you want to change a property inside a method, you need to mark it using the mutating keyword, like this

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

//Because it changes the property, Swift will only allow that method to be called on Person instances that are variables
var person = Person(name: "Ed")
person.makeAnonymous()



/// Video 6 Properties and methods of strings
//We’ve used lots of strings so far, and it turns out they are structs – they have their own methods and properties we can use to query and manipulate the string

let string = "Do or do not, there is no try."
//You can read the number of characters in a string using its count property:
print(string.count)

//They have a hasPrefix() method that returns true if the string starts with specific letters:
print(string.hasPrefix("Do"))

//You can uppercase a string by calling its uppercased() method:
print(string.uppercased())

//And you can even have Swift sort the letters of the string into an array:
print(string.sorted())



/// Video 7   Properties and methods of arrays
//Arrays are also structs, which means they too have their own methods and properties we can use to query and manipulate the array

var toys = ["Woody"]

//You can read the number of items in an array using its count property:
print(toys.count)

//If you want to add a new item, use the append() method like this:
toys.append("Buzz")

//You can locate any item inside an array using its firstIndex() method, like this:
toys.firstIndex(of: "Buzz")
//That will return 1 because arrays count from 0.

//Just like with strings, you can have Swift sort the items of the array alphabetically:
print(toys.sorted())

//Finally, if you want to remove an item, use the remove() method like this:
toys.remove(at: 0)

//Arrays have lots more properties and methods – try typing toys. to bring up Xcode’s code completion options.





/// Day 9

/// Video 1 Initializers
//Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct

struct User {
    var username: String
    
    //We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this
    init() {
            username = "Anonymous"
            print("Creating a new user!")
        }
}

//You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.
//Now our initializer accepts no parameters, we need to create the struct like this

var user = User()
user.username = "twostraws"



/// Video 2
//Referring to the current instance
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used
//For example, if you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, self helps you distinguish between the property and the parameter

struct PErson {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}



/// Video 3 Lazy properties
//Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time:

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

//We might use that FamilyTree struct as a property inside a Person struct, like this
struct PERson {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

//But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed

//So, if you want to see the “Creating family tree!” message, you need to access the property at least once



/// Video 4 Static properties and methods
// All the properties and methods we’ve created so far have belonged to individual instances of structs, which means that if we had a Student struct we could create several student instances each with their own properties and methods

struct Student {
    var name: String
    static var classSize = 0
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let Ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

//Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize

print(Student.classSize)



/// Video 5 Access control
//Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example

// This is a privite ID

struct PERSon {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let eddie = PERSon(id: "12345")



///Video 6 Structue conclusion.

// 1. You can create your own types using structures, which can have their own properties and methods.

// 2. You can use stored properties or use computed properties to calculate values on the fly.

//3. If you want to change a property inside a method, you must mark it as mutating.

// 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.

// 5. Use the self constant to refer to the current instance of a struct inside a method.

// 6. The lazy keyword tells Swift to create properties only when they are first used.

// 7.You can share properties and methods across all instances of a struct using the static keyword.

// 8.Access control lets you restrict what code can use properties and methods.
