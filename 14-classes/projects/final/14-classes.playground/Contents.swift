
class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  var fullName: String {
    "\(firstName) \(lastName)"
  }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")

class SimplePerson {
  let name: String
  init(name: String) {
    self.name = name
  }
}

/*
struct SimplePerson {
  let name: String
}
*/

var var1 = SimplePerson(name: "John")
var var2 = var1

struct Location {
  let x: Int
  let y: Int
}

struct DeliveryArea {
  var range: Double
  let center: Location
}

var area1 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range) // 2.5
print(area2.range) // 2.5

area1.range = 4
print(area1.range) // 4.0
print(area2.range) // 2.5

var homeOwner = john  // "Johnny Appleseed"
john.firstName = "John" // John wants to use his short name!
john.firstName // "John"
homeOwner.firstName // "John"

john === homeOwner // true

let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")

john === homeOwner // true
john === imposterJohn // false
imposterJohn === homeOwner // false

// Assignment of existing variables changes the instances the variables reference.
homeOwner = imposterJohn
john === homeOwner // false

homeOwner = john
john === homeOwner // true

// Create fake, imposter Johns. Use === to see if any of these imposters are our real John.
var imposters = (0...100).map { _ in
  Person(firstName: "John", lastName: "Appleseed")
}

// Equality (==) is not effective when John cannot be identified by his name alone
imposters.contains {
  $0.firstName == john.firstName && $0.lastName == john.lastName
} // true

// Check to ensure the real John is not found among the imposters.
imposters.contains {
  $0 === john
} // false

// Now hide the "real" John somewhere among the imposters.
imposters.insert(john, at: Int.random(in: 0..<100))

// John can now be found among the imposters.
imposters.contains {
  $0 === john
} // true

// Since `Person` is a reference type, you can use === to grab the real John out of the list of imposters and modify the value.
// The original `john` variable will print the new last name!

if let indexOfJohn = imposters.firstIndex(where: { $0 === john }) {
  imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName // John Bananapeel

struct Grade {
  let letter: String
  let points: Double
  let credits: Double
}

class Student {
  var firstName: String
  var lastName: String
  var grades: [Grade] = []
  var credits = 0.0
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
    credits += grade.credits
  }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
var history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)

// Error: jane is a `let` constant
//jane = Student(firstName: "John", lastName: "Appleseed")

/*
var jane = Student(firstName: "Jane", lastName: "Appleseed")
jane = Student(firstName: "John", lastName: "Appleseed")
 */

jane.credits // 7

// The teacher made a mistake; math has 5 credits
math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)

jane.credits // 12, not 8!

extension Student {
  var fullName: String {
    "\(firstName) \(lastName)"
  }
}

jane.fullName // "Jane Appleseed"
