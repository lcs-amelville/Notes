import Cocoa

class Location {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
    self.x = x
    self.y = y
    }
}

// September at LCS
var home = Location(x: 7, y: 10)
var school = home

// Home is a copy of school. This doesn't matter if it's a structure. But if it's a class the location will change any time that school changes.

// Where is home?
home.x
home.y

// Where is school?
school.x
school.y

// Christmas vacation time
home.x = 19
home.y = 10

// Where is home
home.x
home.y

// A class effects the copy of a variable. A structure doesn't effect the copy
// Where is school
school.x
school.y


// when it is a class you can change either of the refferences to change the location.
school.x = 30

home.x





