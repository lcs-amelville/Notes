import Cocoa



/// Day 12 Class
/// Day 2 Hacking with SwiftUI


/// Video 1 Functions.
//Functions let you define re-usable pieces of code that perform specific pieces of functionality. Usually functions are able to receive some values to modify the way they work, but it's not required

func favoriteAlbum() {
    print("My favorite is Fearless")
}

//If you put that code into your playground, nothing will be printed. And yes, it is correct. The reason nothing is printed is that we've placed the "My favorite is Fearless" message into a function called favoriteAlbum(), and that code won't be called until we ask Swift to run the favoriteAlbum() function. To do that, add this line of code

//You then call that function by writing its name followed by an open and close parentheses
favoriteAlbum()

//what if we wanted to print a different album each time? In that case, we could tell Swift we want our function to accept a value when it's called, then use that value inside it.
func FavoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

FavoriteAlbum(name: "Fearless")

//You can make your functions accept as many parameters as you want, so let's make it accept a name and a year

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

//These function parameter names are important, and actually form part of the function itself. Sometimes you’ll see several functions with the same name, e.g. handle(), but with different parameter names to distinguish the different actions


/// Part 2 External and internal parameter names
//Sometimes you want parameters to be named one way when a function is called, but another way inside the function itself

// We name it myString externaly and str internally.

func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello")

//You can also specify an underscore, _, as the external parameter name, which tells Swift that it shouldn’t have any external name at all.

//Swifts way of writing this is

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLetters(in: "Hello")



/// Part 3 Return Values.
//As an example, let's write a function that returns true if an album is one of Taylor Swift's, or false otherwise. This needs to accept one parameter (the name of the album to check) and will return a Boolean.

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }

    return false
}

//If you wanted to try your new switch/case knowledge, this function is a place where it would work well.
//You can now call that by passing the album name in and acting on the result

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}





/// Video 2 Optionals
//One of the most common ways that code fails is when it tries to use data that is bad or missing. For example, imagine a function like this

func getHaterStatus() -> String {
    return "Hate"
}

//Now, when it comes to a string you might think an empty string is a great way to communicate nothing, and that might be true sometimes. But how about numbers – is 0 an "empty number"? Or -1
//An optional value is one that might have a value or might not

//For now, imagine a survey where you ask someone, “On a scale of 1 to 5 how awesome is Taylor Swift?” – what would someone answer if they had never heard of her? 1 would be unfairly slating her, and 5 would be praising her when they had no idea who Taylor Swift was. The solution is optionals: “I don’t want to provide a number at all.”
//When we used -> String it means "this will definitely return a string," which means this function cannot return no value, and thus can be called safe in the knowledge that you'll always get a value back that you can use as a string

func getHaterStatus() -> String? {
    return "Hate"
}
// When you put in a ? it's an optional string.

//In Swift, this "no value" has a special name: nil. Change the function to this

func GetHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

//when you declare a value as being optional, Swift will make sure you handle it safely
//To fix the problem, we need to make the status variable a String?, or just remove the type annotation entirely and let Swift use type inference. The first option looks like this:


var status = GetHaterStatus(weather: "rainy")


//Regardless of which you choose, that value might be there or might not, and by default Swift won't let you use it dangerously.
func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

//That takes a string and prints a message depending on its contents. This function takes a String value, and not a String? value – you can't pass in an optional here, it wants a real string, which means we can't call it using the status variable

//Swift has two solutions. Both are used, but one is definitely preferred over the other. The first solution is called optional unwrapping, and it's done inside a conditional statement using special syntax. It does two things at the same time: checks whether an optional has a value, and if so unwraps it into a non-optional type then runs a code block.
if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go…
}

//These if let statements check and unwrap in one succinct line of code, which makes them very common. Using this method, we can safely unwrap the return value of getHaterStatus() and be sure that we only call takeHaterAction() with a valid, non-optional string

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

func TakeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}


// The rest of the video is him explaining about Optionals because they are difficult in his opinion.



/// Video 3 Optional chaining

//Swift has two techniques to help make your code less complicated. The first is called optional chaining, which lets you run code only if your optional has a value

func AlbumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

///let album = AlbumReleased(year: 2006)
///print("The album is \(album)")

//The problem is, albumReleased() returns an optional string: it might return a string or it might return nothing at all. So, what we really mean is, "if we got a string back make it uppercase, otherwise do nothing." And that's where optional chaining comes in, because it provides exactly that behavior

//Use this to call instead.
let album = AlbumReleased(year: 2006)?.uppercased()
print("The album is \(album)")

//Note that there's a question mark in there, which is the optional chaining: everything after the question mark will only be run if everything before the question mark has a value

//Your optional chains can be as long as you need, for example:




/// Video 3 Part 2 The nil coalescing operator
//What it does is let you say "use value A if you can, but if value A is nil then use value B
//It's particularly helpful with optionals, because it effectively stops them from being optional because you provide a non-optional value B

let Album = AlbumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")

//That double question mark is the nil coalescing operator, and in this situation it means "if albumReleased() returned a value then put it into the album variable, but if albumReleased() returned nil then use 'unknown' instead.




/// Video 4 Enumerations
//Enumm are a way for you to define your own kind of value in Swift


//func GEtHaterStatus(weather: String) -> String? {
//    if weather == "sunny" {
//        return nil
//    } else {
//        return "Hate"
//    }
//}


//That function accepts a string that defines the current weather. The problem is, a string is a poor choice for that kind of data
//Enums solve this problem by letting you define a new data type, then define the possible values it can hold. For example, we might say there are five kinds of weather: sun, cloud, rain, wind and snow. If we make this an enum, it means Swift will accept only those five values


//enum WeatherType {
//    case sun, cloud, rain, wind, snow
//}
//
//func GEtHaterStatus(weather: WeatherType) -> String? {
//    if weather == WeatherType.sun {
//        return nil
//    } else {
//        return "Hate"
//    }
//}

//GEtHaterStatus(weather: WeatherType.cloud)


//1 gives our type a name, WeatherType. This is what you'll use in place of String or Int in your code. Line 2 defines the five possible cases our enum can be, as I already outlined. Convention has these start with a lowercase letter, so “sun”, “cloud”, etc. And line 3 is just a closing brace, ending the enum

//Now, go back and read that code again, because I'm about to rewrite it with two changes that are important. All set

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func GEtHaterStatus(weather: WeatherType) -> String? {
    if weather == .sun {
        return nil
    } else {
        return "Hate"
    }
}

GEtHaterStatus(weather: .cloud)


//First, each of the weather types are now on their own line. This might seem like a small change, and indeed in this example it is, but it becomes important soon. The second change was that I wrote if weather == .sun – I didn't need to spell out that I meant WeatherType.sun because Swift knows I am comparing against a WeatherType variable
//Enums are particularly useful inside switch/case blocks



///Video 5 Structures.
    //Structs are complex data types, meaning that they are made up of multiple values

struct Person {
    var clothes: String
    var shoes: String
}

//When you define a struct, Swift makes them very easy to create because it automatically generates what's called a memberwise initializer. You create the Struct passing in initial values for its two properties, like this

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

//Once you have created an instance of a struct, you can read its properties just by writing the name of the struct, a period, then the property you want to read

print(taylor.clothes)
print(other.shoes)


/// Part 2 Video 5 Functions inside structs
//You can place functions inside structs, and in fact it’s a good idea to do so for all functions that read or change data inside the struct. For example, we could add a function to our Person struct to describe what they are wearing, like this:

struct person {
    var clothes: String
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

//There’s one more thing you ought to know but can't see in that code: when you write a function inside a struct, it's called a method instead. In Swift you write func whether it's a function or a method, but the distinction is preserved when you talk about them



/// Video 6 Classes.
//


