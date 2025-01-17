import Foundation

//================================================================
class PersonREFERENCETYPES {
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

let john = PersonREFERENCETYPES(firstName: "Johnny", lastName: "Appleseed")
john.firstName = "John"
john.firstName
//================================================================
class SimplePersonREFERENCETYPES {
  let name: String
  init(name: String) {
    self.name = name
  }
}

var var1 = SimplePersonREFERENCETYPES(name: "John")

//================================================================
var var2 = var1

//================================================================
struct SimplePersonVALUETYPES {
  let name: String
}

//================================================================
struct LocationVALUETYPES {
  let x: Int
  let y: Int
}

struct DeliveryAreaVALUETYPES {
  var range: Double
  let center: LocationVALUETYPES
}

var area1 = DeliveryAreaVALUETYPES(range: 2.5,
                         center: LocationVALUETYPES(x: 2, y: 4))
var area2 = area1
print(area1.range) // 2.5
print(area2.range) // 2.5

area1.range = 4
print(area1.range) // 4.0
print(area2.range) // 2.5

//================================================================
var homeOwner = john    // "Johnny Appleseed"
john.firstName = "John" // John wants to use his short name!
john.firstName          // "John"
homeOwner.firstName     // "John"

// Mini-Exercise 1 ================================================
//Change the value of lastName on homeOwner, then try reading fullName on both john and homeOwner. What do you observe?
homeOwner.lastName = "Blueberry"
homeOwner.lastName
john.lastName
john.lastName = "Appleseed"
john.lastName
john.firstName
//================================================================
john === homeOwner // true

//================================================================
let imposterJohn = PersonREFERENCETYPES(firstName: "Johnny",
                          lastName: "Appleseed")

john === homeOwner         // true
john === imposterJohn      // false
imposterJohn === homeOwner // false

// Assignment of existing variables changes the instances the variables reference.
homeOwner = imposterJohn
john === homeOwner // false

homeOwner = john
john === homeOwner // true

//================================================================
// Create fake, imposter Johns. Use === to see if any of these imposters are our real John.
var imposters = (0...100).map { _ in
  PersonREFERENCETYPES(firstName: "John", lastName: "Appleseed")
}

// Equality (==) is not effective when John cannot be identified by his name alone
imposters.contains {
  $0.firstName == john.firstName && $0.lastName == john.lastName
} // true

//================================================================
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
if let indexOfJohn = imposters.firstIndex(where:
                                          { $0 === john }) {
  imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName // John Bananapeel

// Mini-Exercise 2 ==================================
//Write a function memberOf(person: Person, group: [Person]) -> Bool that will return true if person can be found inside group and false if it can not.  Test it by creating two arrays of five `Person` objects for `group` and using `john` as the `person`. Put `john` in one of the arrays, but not in the other.
let johnny = PersonREFERENCETYPES(firstName: "Johnny", lastName: "Appleseed")
let jane = PersonREFERENCETYPES(firstName: "Jane", lastName: "Appleseed")
let anonymous1 = PersonREFERENCETYPES(firstName: "Bob", lastName: "Anonymous")
let anonymous2 = PersonREFERENCETYPES(firstName: "Bill", lastName: "Anonymous")
let anonymous3 = PersonREFERENCETYPES(firstName: "Biff", lastName: "Anonymous")

let group1 = [johnny, jane, anonymous1, anonymous2, anonymous3]
let group2 = [johnny, john, anonymous1, anonymous2, anonymous3]

func memberOf(person: PersonREFERENCETYPES, group: [PersonREFERENCETYPES]) -> Bool {
  group.contains(where: {$0 === person})
}
memberOf(person: john, group: group1)
memberOf(person: john, group: group2)

//================================================================
struct GradeMUTABILITY {
  let letter: String
  let points: Double
  let credits: Double
}

class StudentMUTABILITY {
  var firstName: String
  var lastName: String
  var grades: [GradeMUTABILITY] = []

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  func recordGrade(_ grade: GradeMUTABILITY) {
    grades.append(grade)
  }
}

var janeMUTABILITY = StudentMUTABILITY(firstName: "Jane", lastName: "Appleseed")
var historyMUTABILITY = GradeMUTABILITY(letter: "B", points: 9.0, credits: 3.0)
var mathMUTABILITY = GradeMUTABILITY(letter: "A", points: 16.0, credits: 4.0)

janeMUTABILITY.recordGrade(historyMUTABILITY)
janeMUTABILITY.recordGrade(mathMUTABILITY)

//================================================================
//var jane = Student(firstName: "Jane", lastName: "Appleseed")
janeMUTABILITY = StudentMUTABILITY(firstName: "John", lastName: "Appleseed")
// Mini-Exercise 3 ============================================
//Add a computed property to Student that returns the student’s Grade Point Average or GPA. A GPA is defined as the number of points earned divided by the number of credits taken. For the example above, Jane earned (9 + 16 = 25) points while taking (3 + 4 = 7) credits, making her GPA (25 / 7 = 3.57).
//Note: Points in most American universities range from 4 per credit for an A, down to 1 point for a D (with an F being 0 points). For this exercise, you may, of course, use any scale that you want!
struct GradeCOMPPROP {
  let letter: String
  let points: Double
  let credits: Double
}

class StudentCOMPPROP {
  var firstName: String
  var lastName: String
  var grades: [GradeCOMPPROP] = []
  var gradePointAverage : Double {
    var points = 0.0
    var credits = 0.0
    for grade in grades {
      points += grade.points
      credits += grade.credits
    }
    return points / credits
  }
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  func recordGrade(_ grade: GradeCOMPPROP) {
    grades.append(grade)
  }
}

var janeCOMPPROP = StudentCOMPPROP(firstName: "Jane", lastName: "Appleseed")
var historyCOMPPROP = GradeCOMPPROP(letter: "B", points: 9.0, credits: 3.0)
var mathCOMPPROP = GradeCOMPPROP(letter: "A", points: 16.0, credits: 4.0)

janeCOMPPROP.recordGrade(historyCOMPPROP)
janeCOMPPROP.recordGrade(mathCOMPPROP)
janeCOMPPROP.gradePointAverage

////================================================================
//var credits = 0.0
//
////================================================================
//func recordGrade(_ grade: Grade) {
//  grades.append(grade)
//  credits += grade.credits
//}
//
////================================================================
//jane.credits // 7
//
//// The teacher made a mistake; math has 5 credits
//math = Grade(letter: "A", points: 20.0, credits: 5.0)
//jane.recordGrade(math)
//
//jane.credits // 12, not 8!
//
////================================================================
//extension Student {
//  var fullName: String {
//    "\(firstName) \(lastName)"
//  }
//}
//
// Challenge 1: Movie Lists ====================================
//Imagine you’re writing a movie-viewing app in Swift. Users can create lists of movies and share those lists with other users. Create a User and a List class that uses reference semantics to help maintain lists between users.
//User: Has a method addList(_:) that adds the given list to a dictionary of List objects (using the name as a key), and list(forName:) -> List? that returns the List for the provided name.
//List: Contains a name and an array of movie titles. A report method will print all the movies in the list.
//Create jane and john users and create a list that they share. Have both jane and john modify the list and call report from both users. Are all the changes reflected?
//What happens when you implement the same with structs? What problems do you run into?
class UserMOVIELISTSII {
  var lists : [String: ListMOVIELISTSII] = [:]

  func addList(_ newList: ListMOVIELISTSII) {
    lists[newList.name] = newList
  }

  func list(forName: String) -> ListMOVIELISTSII? {
    lists[forName]
  }
}
class ListMOVIELISTSII {
  var name : String
  var titles : [String] = []

  init(name: String) {
    self.name = name
  }

  func report() {
    print("Movie List: \(name)")
    for title in titles {
      print(title)
    }
    print("\n")
  }
}


  let janeMOVIELISTSII = UserMOVIELISTSII()
  let johnMOVIELISTSII = UserMOVIELISTSII()
  var actionListMOVIELISTSII = ListMOVIELISTSII(name: "Action")
  
  johnMOVIELISTSII.addList(actionListMOVIELISTSII)
  janeMOVIELISTSII.addList(actionListMOVIELISTSII)
  johnMOVIELISTSII.lists["Action"]?.titles.append("Rambo")
  janeMOVIELISTSII.lists["Action"]?.titles.append("Terminator")
janeMOVIELISTSII.lists["Action"]?.titles
johnMOVIELISTSII.lists["Action"]?.titles
var johnMore = ["The Raiders of The Lost Ark", "Aladin", "Peter Pan", "Snow White", "Lion King", "Tarzan",]
var janeMore = ["Star Wars: The Empire Strikes Back", "Star Wars: Return of the Jedi", "Star Wars: The Force Awakens",]
janeMOVIELISTSII.lists["Action"]?.titles.append(contentsOf: janeMore)
johnMOVIELISTSII.lists["Action"]?.titles.append(contentsOf: johnMore)
janeMOVIELISTSII.lists["Action"]?.titles
johnMOVIELISTSII.lists["Action"]?.titles
janeMOVIELISTSII === johnMOVIELISTSII
actionListMOVIELISTSII === actionListMOVIELISTSII


// Challenge 2: T-shirt Store =====================================
//Your challenge here is to build a set of entities to support a T-shirt store. Decide if each entity should be a class or a struct and why.
//TShirt: Represents a shirt style you can buy. Each TShirt has a size, color, price, and an optional image on the front.
//User: A registered user of the t-shirt store app. A user has a name, email, and a ShoppingCart (see below).
//Address: This represents a shipping address and contains the name, street, city, and zip code.
//ShoppingCart: Holds a current order, composed of an array of TShirt that the User wants to buy, as well as a method to calculate the total cost. Additionally, an Address represents where the order will be shipped.
//Bonus: After you’ve decided on whether to use a class or struct for each entity, go ahead and implement them all!
enum sizeList : Int {
  case xsmall = 1
  case small
  case medium
  case large
  case xlarge
}
enum colorList : Int {
  case red = 1
  case blue
  case green
  case yellow
  case black
}
enum imageList : Int {
  case image1 = 1
  case image2
  case image3
  case image4
  case image5
}
enum priceList : Double {
  case xsmall = 10.00
  case small = 13.00
  case medium = 16.00
  case large = 19.00
  case xlarge = 21.00
}
struct TShirt {
  var size = ""
  var color = ""
  var price = 0.0
  var image = ""
  
  init() {
    size = getSize()
    color = getColor()
    price = getPrice()
    image = getImage()
  }

  func getSize() -> String {
    let sz = sizeList(rawValue: Int.random(in: 1...5))!
      return "\(sz)"
  }
  func getColor() -> String {
    let cl = colorList(rawValue: Int.random(in: 1...5))!
    return "\(cl)"
  }
  func getImage() -> String {
    let im = imageList(rawValue: Int.random(in: 1...5))!
    return "\(im)"
  }
  func getPrice() -> Double {
    let shirtPrice : Double = switch self.size {
      case "xsmall": priceList.xsmall.rawValue
      case "small": priceList.small.rawValue
      case "medium": priceList.medium.rawValue
      case "large": priceList.large.rawValue
      case "xlarge": priceList.xlarge.rawValue
    default: 0.0
    }
    return shirtPrice
  }
}
let tShirt = TShirt()
print("Size: \(tShirt.size), Color: \(tShirt.color), Price: \(tShirt.price), Image: \(tShirt.image)")
class User {
  var name : String = ""
  var email : String = ""
  var shoppingCart = ShoppingCart() // = [] at Start
  
//  init(name: String, email: String) {
//    self.name = name
//    self.email = email
//  }
}

let zipCode = Int.random(in: 10000...99999)
zipCode
let streetNumber = Int.random(in: 1...1000)
streetNumber
enum cityList : Int {
  case city1 = 1
  case city2
  case city3
  case city4
  case city5
}
let addressCity = cityList(rawValue: Int.random(in: 1...5))!
"String City: \(addressCity)"
enum streetList : Int {
  case street1st = 1
  case street2nd
  case street3rd
  case street4th
  case street5th
  case street6th
  case street7th
  case street8th
  case street9th
  case street10th
  case street11th
  case street12th
  case street13th
  case street14th
  case street15th
  case street16th
  case street17th
  case street18th
  case street19th
  case street20th
  case street21st
  case street22nd
  case street23rd
  case street24th
  case street25th
  case street26th
  case street27th
  case street28th
  case street29th
  case street30th
  case street31st
  case street32nd
  case street33rd
  case street34th
  case street35th
  case street36th
  case street37th
  case street38th
  case street39th
  case street40th
}
let addressStreet = streetList(rawValue: Int.random(in: 1...40))!
"String Street: \(addressStreet)"

struct Address {
  var name : String
  var street : String
  var city : String
  var zipCode : Int
  
  init(name: String, street: String, city: String, zipCode: Int) {
    self.name = name
    self.street = street
    self.city = city
    self.zipCode = zipCode
  }
}
class ShoppingCart {
  var order : [TShirt] = [] // =[] at Start
  
  func cost() -> Double {
    var total = 0.0
    for item in order {
      total += item.price
    }
    return total
  }
}










//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
////================================================================
//
//
