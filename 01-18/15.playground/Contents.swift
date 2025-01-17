import Foundation

//================================================================
struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Person {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Student {
  var firstName: String
  var lastName: String
  var grades: [Grade] = []

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

//================================================================
class Student: Person {
  var grades: [Grade] = []

  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

//================================================================
let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // "John"
jane.firstName // "Jane"

//================================================================
class BandMember: Student {
  var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
  // This is an example of an override, which we’ll cover soon.
  override var minimumPracticeTime: Int {
    get {
      super.minimumPracticeTime * 2
    }
    set {
      super.minimumPracticeTime = newValue / 2
    }
  }
}

//================================================================
func phonebookName(_ person: Person) -> String {
  "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane",
                            lastName: "Appleseed")

phonebookName(person)     // Appleseed, Johnny
phonebookName(oboePlayer) // Appleseed, Jane

//================================================================
var hallMonitor = Student(firstName: "Jill",
                          lastName: "Bananapeel")

//================================================================
hallMonitor = oboePlayer

//================================================================
oboePlayer as Student
(oboePlayer as Student).minimumPracticeTime

//================================================================
hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)

hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)

//================================================================
if let hallMonitor = hallMonitor as? BandMember {
  print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week.")
}

//================================================================
func afterClassActivity(for student: Student) -> String {
  "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
  "Goes to practice!"
}

//================================================================
afterClassActivity(for: oboePlayer)            // Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!

//================================================================
class StudentAthlete: Student {
  var failedClasses: [Grade] = []

  override func recordGrade(_ grade: Grade) {
    super.recordGrade(grade)

    if grade.letter == "F" {
      failedClasses.append(grade)
    }
  }

  var isEligible: Bool {
    failedClasses.count < 3
  }
}

//================================================================
override func recordGrade(_ grade: Grade) {
  var newFailedClasses: [Grade] = []
  for grade in grades {
    if grade.letter == "F" {
      newFailedClasses.append(grade)
    }
  }
  failedClasses = newFailedClasses

  super.recordGrade(grade)
}

//================================================================
class AnotherStudent: Person {
  final func recordGrade(_ grade: Grade) {}
}

//================================================================
class StudentAthlete: Student {
  var sports: [String]
  // original code
}

//================================================================
class StudentAthlete: Student {
  var sports: [String]

  init(sports: [String]) {
    self.sports = sports
    // Build error - super.init isn’t called before
    // returning from initializer
  }
  // original code
}


//================================================================
class StudentAthlete: Student {
  var sports: [String]

  init(firstName: String, lastName: String, sports: [String]) {
    self.sports = sports
    super.init(firstName: firstName, lastName: lastName)
  }
  // original code
}

//================================================================
class StudentAthlete: Student {
  var sports: [String]

  init(firstName: String, lastName: String, sports: [String]) {
    // 1
    self.sports = sports
    // 2
    let passGrade = Grade(letter: "P", points: 0.0,
                          credits: 0.0)
    // 3
    super.init(firstName: firstName, lastName: lastName)
    // 4
    recordGrade(passGrade)
  }
  // original code
}

//================================================================
class Student {
  let firstName: String
  let lastName: String
  var grades: [Grade] = []

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  init(transfer: Student) {
    self.firstName = transfer.firstName
    self.lastName = transfer.lastName
  }

  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

//================================================================
class Student {
  let firstName: String
  let lastName: String
  var grades: [Grade] = []

  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  // original code
}

//================================================================
class StudentAthlete: Student {
  // Now required by the compiler!
  required init(firstName: String, lastName: String) {
    self.sports = []
    super.init(firstName: firstName, lastName: lastName)
  }
  // original code
}

//================================================================
class Student {
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName,
              lastName: transfer.lastName)
  }
  // original code
}

//================================================================
class Student: Person {
  var grades: [Grade]
  var sports: [Sport]
  // original code
}

//================================================================
class Team {
  var players: [StudentAthlete] = []

  var isEligible: Bool {
    for player in players {
      if !player.isEligible {
        return false
      }
    }
    return true
  }
}

//================================================================
// A button that can be pressed.
class Button {
  func press() {}
}

// An image that can be rendered on a button
class Image {}

// A button that is composed entirely of an image.
class ImageButton: Button {
  var image: Image

  init(image: Image) {
    self.image = image
  }
}

// A button that renders as text.
class TextButton: Button {
  var text: String

  init(text: String) {
    self.text = text
  }
}

//================================================================
var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)

//================================================================
someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object

//================================================================
class Person {
  // original code
  deinit {
    print("\(firstName) \(lastName) is being removed from memory!")
  }
}

//================================================================
class Student: Person {
  var partner: Student?
  // original code
  deinit {
    print("\(firstName) is being deallocated!")
  }
}

var alice: Student? = Student(firstName: "Alice",
                              lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob",
                            lastName: "Appleseed")

alice?.partner = bob
bob?.partner = alice

//================================================================
alice = nil
bob = nil

//================================================================
class Student: Person {
  weak var partner: Student?
  // original code
}

//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


