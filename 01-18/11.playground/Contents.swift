import Foundation

//================================================================
let restaurantLocation = (3, 3)
let restaurantRange = 2.5

// Pythagorean Theorem 📐🎓
func distance(
  from source: (x: Int, y: Int),
  to target: (x: Int, y: Int)
) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}

//================================================================
func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance = distance(from: location,
                                  to: restaurantLocation)
  return deliveryDistance < restaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5)) // false

//================================================================
let restaurantLocationB = (3, 3)
let restaurantRangeB = 2.5

let otherRestaurantLocationB = (8, 8)
let otherRestaurantRangeB = 2.5

// Pythagorean Theorem 📐🎓
func distanceB(
  from source: (x: Int, y: Int),
  to target: (x: Int, y: Int)
) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}

func isInDeliveryRangeB(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance =
    distanceB(from: location, to: restaurantLocationB)

  let secondDeliveryDistance =
    distanceB(from: location, to: otherRestaurantLocationB)

  return deliveryDistance < restaurantRangeB ||
    secondDeliveryDistance < otherRestaurantRangeB
}

isInDeliveryRangeB(location: (x: 5, y: 5)) // false

//================================================================
struct Location {
  let x: Int
  let y: Int
}

//================================================================
let storeLocation = Location(x: 3, y: 3)

//================================================================
struct DeliveryArea {
  let center: Location
  var radius: Double
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

// Mini-Exercise 1 ================================================================
struct PizzaOrder {
  var topping : [String]
  var size : Character
  var base : String
}

//================================================================
storeArea.radius // 2.5

//================================================================
storeArea.center.x // 3

//================================================================
storeArea.radius = 3.5

//================================================================
var fixedArea = DeliveryArea(center: storeLocation, radius: 4)

// Error: Cannot assign to property
//fixedArea.radius = 3.5


// Mini-Exercise 2 ================================================================
var restaurantLocationC = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)

var otherRestaurantLocationC = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)

func distanceC(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}

@MainActor func isInDeliveryRangeC(location: Location) -> Bool {
  let deliveryDistance =
  distanceC(from: location, to: restaurantLocationC.center)

  let secondDeliveryDistance =
  distanceC(from: location, to: otherRestaurantLocationC.center)

  return deliveryDistance < restaurantRangeB ||
    secondDeliveryDistance < otherRestaurantRangeB
}

isInDeliveryRangeC(location: Location(x: 5, y: 5)) // false

//================================================================
let areas = [
  DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5),
  DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
]

func isInDeliveryRangeD(_ location: Location) -> Bool {
  for area in areas {
    let distanceToStore =
      distance(from: (area.center.x, area.center.y),
               to: (location.x, location.y))

    if distanceToStore < area.radius {
      return true
    }
  }
  return false
}

let customerLocation1 = Location(x: 5, y: 5)
let customerLocation2 = Location(x: 7, y: 7)

isInDeliveryRangeD(customerLocation1) // false
isInDeliveryRangeD(customerLocation2) // true

// Mini-Exercise 3a ================================================================
struct LocationMini3 {
  let x: Int
  let y: Int
}
//Change distance(from:to:) to use Location as your parameters instead of x-y tuples.
func distanceMini3(from source: LocationMini3, to target: LocationMini3) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX +
    distanceY * distanceY).squareRoot()
}

let location1Mini3 = LocationMini3(x: 8, y: 3)
let location2Mini3 = LocationMini3(x: 10, y: 8)
distanceMini3(from: location1Mini3, to: location2Mini3)
// Mini-Exercise 3b ================================================================
//Change contains(_:) to call the new distance(from:to:) with Location.
struct DeliveryAreaMini3 {
  let center: LocationMini3
  var radius: Double
  
  func contains(_ location: LocationMini3) -> Bool {
      distanceMini3(from: center, to: location) < radius
  }
}
let area1Mini3 = DeliveryAreaMini3(center: LocationMini3(x: 8, y: 8), radius: 2.5)
let location3Mini3 = LocationMini3(x: 7, y: 7)
area1Mini3.contains(location3Mini3) // true

// Mini-Exercise 3b ================================================================
//Add a method overlaps(with:) on DeliveryArea that can tell you if the area overlaps with another area.
struct DeliveryAreaMini3new {
  let center: LocationMini3
  var radius: Double
  
  func contains(_ location: LocationMini3) -> Bool {
      distanceMini3(from: center, to: location) < radius
  }
  func overlaps(with area: DeliveryAreaMini3new) -> Bool {
    distanceMini3(from: center, to: area.center) <= (radius + area.radius)
  }
}

  let area2Mini3 = DeliveryAreaMini3new(center: LocationMini3(x: 3, y: 3), radius: 2.5)
  let area3Mini3 = DeliveryAreaMini3new(center: LocationMini3(x: 8, y: 8), radius: 2.5)
area2Mini3.overlaps(with: area3Mini3) // false

//================================================================
var a = 5
var b = a

a // 5
b // 5

a = 10

a // 10
b // 5

//================================================================
var area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
var area2 = area1

area1.radius // 2.5
area2.radius // 2.5

area1.radius = 4

area1.radius // 4.0
area2.radius // 2.5

//================================================================
//struct Int : FixedWidthInteger, SignedInteger {
//  // …
//}

//================================================================
public protocol CustomStringConvertible {
  /// A textual representation of this instance.
  var description: String { get }
}

//================================================================
struct DeliveryAreaMini3newII : CustomStringConvertible {
  let center: LocationMini3
  var radius: Double
  var description: String {
    return "(\(center.x), \(center.y)) \(radius)"
  }
//  var description: String {
//    return "(\(x), \(y))"
//  }
  func contains(_ location: LocationMini3) -> Bool {
      distanceMini3(from: center, to: location) < radius
  }
  func overlaps(with area: DeliveryAreaMini3newII) -> Bool {
    distanceMini3(from: center, to: area.center) <= (radius + area.radius)
  }
}

//================================================================
let area4Mini3 = DeliveryAreaMini3newII(center: LocationMini3(x: 3, y: 3), radius: 2.5)
let area5Mini3 = area4Mini3
print(area4Mini3) // Area with center: (x: 3, y: 3), radius: 4.0
print(area5Mini3) // Area with center: (x: 3, y: 3), radius: 2.5
print("\n")
struct Point {
    let x: Int, y: Int
}
let p = Point(x: 21, y: 30)
print(p)
// Prints "Point(x: 21, y: 30)"
extension Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}
print(p)
// Prints "(21, 30)"




// Challenge 1: Fruit Tree Farm ================================================================
//Imagine you’re at a fruit tree farm and you grow different kinds of fruits: pears, apples and oranges. After the fruits are picked, a truck brings them in to be processed at the central facility. Since the fruits are all mixed together on the truck, the workers in the central facility have to sort them into the correct inventory container one by one.
//Implement an algorithm that receives a truck full of different kinds of fruits and places each fruit into the correct inventory container.
//Keep track of the total weight of fruit processed by the facility and print out how many of each fruit are in the inventory.
struct Fruit {
  let kind: String // e.g. Apple, Pear, Orange
  let weight: Int // measured in grams
}
let truck: [Fruit] = [
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
]
truck[1]


var Apple = 0
var Pear = 0
var Orange = 0
for fruit in truck {
  switch fruit.kind {
  case "Apple":
    Apple += fruit.weight
  case "Pear":
    Pear += fruit.weight
  default:
    Orange += fruit.weight
  }
}

print("Quantity of Oranges is \(Orange) grams")
print("Quantity of Pears is \(Pear) grams")
print("Quantity of Apples is \(Apple) grams")




// Challenge 2: A T-shirt Model ================================================================
//Create a T-shirt structure that has size, color and material options. Provide a method to calculate the cost of a shirt based on its attributes.
struct T_shirt {
  var size : Character // S, M, L
  var color : String // aqua, forrest, charcoal, ice
  var material : String // cotton, synthetic
  
  func cost() -> String {
    if material == "cotton" {
      return "$25.00"
    } else {
      return "$15.00"
    }
  }
}

let shirt = T_shirt(size: "M", color: "aqua", material: "cotton")
print(shirt.cost())

// Challenge 3: Battleship ================================================================
//Write the engine for a Battleship-like game. If you aren’t familiar with Battleship, you can brush up on the details at this webpage: http://bit.ly/2nT3JBU
//Use an (x, y) coordinate system for your locations modeled using a structure.
//Ships should also be modeled with structures. Record an origin, direction and length.
//Each ship should be able to report if a “shot” has resulted in a “hit”.
struct BattleshipLocation {
  let x: Int
  let y: Int
}

struct Ship {
  var origin: BattleshipLocation; var compass: Character; var length: Int
  
  
  
}
var destroyer = Ship(origin: BattleshipLocation(x: 3, y:7), compass: "N", length: 3)



//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


