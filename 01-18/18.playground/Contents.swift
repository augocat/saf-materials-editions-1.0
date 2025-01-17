import Foundation

//================================================================
enum PetKind {
  case cat
  case dog
}

//================================================================
struct KeeperKind {
  var keeperOf: PetKind
}

//================================================================
let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

//================================================================
enum EnumKeeperKind {
  case catKeeper
  case dogKeeper
}

//================================================================
class Cat {}
class Dog {}

//================================================================
class KeeperOfCats {}
class KeeperOfDogs {}

//================================================================
class Keeper<Animal> {}

//================================================================
var aCatKeeper = Keeper<Cat>()

//================================================================
class Cat {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Keeper<Animal> {
  var name: String

  init(name: String) {
    self.name = name
  }
}

//================================================================
class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal

  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

//================================================================
let jason = Keeper(name: "Jason",
    morningCare: Cat(name: "Whiskers"),
    afternoonCare: Cat(name: "Sleepy"))

//================================================================
func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
  (y, x)
}

swapped(33, "Jay")  // returns ("Jay", 33)

//================================================================
class Keeper<Animal: Pet> {
   /* definition body as before */
}

//================================================================
protocol Pet {
  var name: String { get }  // all pets respond to a name
}
extension Cat: Pet {}
extension Dog: Pet {}

//================================================================
func callForDinner<Animal>(_ pet: Animal) {
   // What can you write here?
}

//================================================================
func callForDinner<Animal: Pet>(_ pet: Animal) {
   print("Here \(pet.name)-\(pet.name)! Dinner time!")
}

//================================================================
func callForDinner(_ pet: some Pet) {
  print("Here \(pet.name)-\(pet.name)! Dinner time!")
}

//================================================================
func callForDinner<Animal>(_ pet: Animal) where Animal: Pet {
  print("Here \(pet.name)-\(pet.name)! Dinner time!")
}

//================================================================
extension Array where Element: Cat {
  func meow() {
    forEach { print("\($0.name) says meow!") }
  }
}

//================================================================
protocol Meowable {
  func meow()
}

extension Cat: Meowable {
  func meow() {
    print("\(self.name) says meow!")
  }
}

extension Array: Meowable where Element: Meowable {
  func meow() {
    forEach { $0.meow() }
  }
}

//================================================================
let lost: [any Pet] = [Cat(name: "Whiskers"), Dog(name: "Hachiko")]

//================================================================
/// Return a lost Cat.
func findLostCat(name: String) -> Cat? {
  lost.lazy.compactMap {
    $0 as? Cat
  }.first {
    $0.name == name
  }
}

//================================================================
/// Return a lost Dog.
func findLostDog(name: String) -> Dog? {
  lost.lazy.compactMap {
    $0 as? Dog
  }.first {
    $0.name == name
  }
}

//================================================================
func findLostPet(name: String) -> (any Pet)? {
  lost.first { $0.name == name}
}

//================================================================
func findLost<Animal: Pet>(_ petType: Animal.Type, name: String) -> (some Pet)? {
  lost.lazy.compactMap {
    $0 as? Animal
  }.first {
    $0.name == name
  }
}

//================================================================
findLost(Cat.self, name: "Whiskers")
findLost(Dog.self, name: "Hachiko")

//================================================================
func findLost<Animal: Pet>(_ petType: Animal.Type, name: String) -> Animal? {
  lost.lazy.compactMap {
    $0 as? Animal
  }.first {
    $0.name == name
  }
}

//================================================================
findLost(Cat.self, name: "Whiskers")?.meow()
// Whiskers says meow!

//================================================================
let animalAges: [Int] = [2,5,7,9]

//================================================================
let animalAges: Array<Int> = [2,5,7,9]

//================================================================
struct Dictionary<Key: Hashable, Value> // etc..

//================================================================
let intNames: Dictionary<Int, String> = [42: "forty-two"]

//================================================================
let intNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let intNames3 = [42: "forty-two", 7: "seven"]

//================================================================
enum OptionalDate {
  case none
  case some(Date)
}

//================================================================
enum OptionalString {
  case none
  case some(String)
}

//================================================================
struct FormResults {
  // other properties here
  var birthday: OptionalDate
  var lastName: OptionalString
}

//================================================================
enum Optional<Wrapped> {
  case none
  case some(Wrapped)
}

//================================================================
var birthdate: Optional<Date> = .none
if birthdate == .none {
  // no birthdate
}

//================================================================
var birthdate: Date? = nil
if birthdate == nil {
  // no birthdate
}

//================================================================
class Cat {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal

  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

//================================================================
let christine = Keeper<Cat>(name: "Christine")

christine.lookAfter(someCat)
christine.lookAfter(anotherCat)

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


