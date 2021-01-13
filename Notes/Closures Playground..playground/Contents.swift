import Cocoa


// Note on Closures plus how to use them and their syntax.


///Video 1 Creating basic closures
// You can create basiclly a function without a name that can be called just by using the constant name like this driving function below. You can also use these in parameters and functions.
 
let driving = {
    print("I'm driving in my car")
}

driving()



///Video 2 Accepting parameters in a closure
// When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.

let Driving = { (place: String) in
    print("I'm going to \(place) in my car")
}

Driving("London")



///Video 3 Returning values from a closure
//Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword.

//Origoinal
let Diving = { (place: String) in
    print("I'm going to \(place) in my car")
}

// This is how to write it with a return. You need to have the return String in the parameter.
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)



///Video 4 Closures as parameters
//Because closures can be used just like strings and integers, you can pass them into functions.
//If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void”
//So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)



///Video 5 Trailing closure syntax
//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

func Travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

//Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:
travel() {
    print("I'm driving in my car")
}
//In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
travel {
    print("I'm driving in my car")
}
//Trailing closure syntax is extremely common in Swift, so it’s worth getting used to.



