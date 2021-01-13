import Cocoa


// Video 1 Writing Functions

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}



//Video 2 Accepting Parameters.

func square(number: Int) {
    print(number * number)
}

square(number: 8)



//Video 3 Returning Values.

func Square(number: Int) -> Int {
    return number * number
}

let result = Square(number: 8)
print(result)



//Video 4 Parameter labels

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")



//Video 5 Omitting parameter labels

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")



//Video 6 Defult Parameters.

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)



//Video 7 Variadic functions

print("Haters", "gonna", "hate")

func SQuare(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

SQuare(numbers: 1, 2, 3, 4, 5)



//Video 8 and 9 Writing and Running throwing functions.

// Define an enumeration that lists types of password errors
enum PasswordError: Error {
    case obvious
    case needsUppercase
}

// Perform a security check on a given password
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    } else if password == password.lowercased() {
        // If the password was "secret" then it will equal "secret".lowercased()
        // If the password was "sEcREt" then it will not equal "sEcREt".lowercased()
        throw PasswordError.needsUppercase
    }

    return true
}

// Try out a password to see if it is secure
do {
    try checkPassword("password")
    print("That password is good!")
} catch PasswordError.obvious {
    print("You can't use that password because it is too easy to guess.")
} catch PasswordError.needsUppercase {
    print("You can't use that password because it contains no uppercase characters.")
} catch {
    // NOTE: Not a great error message; we try to be specific
    print("You can't use that password.")
}



// Video 10 inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
