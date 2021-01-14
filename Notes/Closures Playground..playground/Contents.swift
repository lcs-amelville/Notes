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
Travel() {
    print("I'm driving in my car")
}
//In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
Travel {
    print("I'm driving in my car")
}
//Trailing closure syntax is extremely common in Swift, so it’s worth getting used to.






//Day 7 Part 2 of closures

//The least you need to know


//Video 1
//Using closures as parameters when they accept parameters

//We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.

//To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

//Now when we call travel() using trailing closure syntax, our closure code is required to accept a string.
travel { (place: String) in
    print("I'm going to \(place) in my car")
}



// Video 2
//Using closures as parameters when they return values
//We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can replace that Void with any type of data to force the closure to return a value.

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

//Now when we call travel() using trailing closure syntax, our closure code is required to accept a string and return a string
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}



//Video 3
//Shorthand parameter names


travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
//However, Swift knows the parameter to that closure must be a string, so we can remove it:
travel { place -> String in
    return "I'm going to \(place) in my car"
}

//It also knows the closure must return a string, so we can remove that:
travel { place in
    return "I'm going to \(place) in my car"
}

//As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
travel {
    "I'm going to \($0) in my car"
}



//Video 4
//Closures with multiple parameters
//This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter’s type.

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

//Because there are two parameters when you write the shorthand you use dollar zero than dollar one.
//We’re going to call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1:

travel {
    "I'm going to \($0) at \($1) miles per hour."
}



//Video 5
//Returning closures from functions
//In the same way that you can pass a closure to a function, you can get closures returned from a function too.
//The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//We can now call travel() to get back that closure, then call it as a function
let result = travel()
result("London")

//It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
let result2 = travel()("London") //This make swiftUI unhappy so use the way up top to do this.



//Video 6
//Capturing values
//If you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more.

//Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called
func traveL() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

//Even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure.
//So, if we call result("London") multiple times, the counter will go up and up

let result3 = traveL()
result("London")



//Video 7
//
