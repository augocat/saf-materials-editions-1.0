import Foundation
//: ## Mini Exercises
//: ### Ordering Pizza
//: Write a structure that represents a pizza order. Include toppings, size and any other option you’d want for a pizza.
struct Pizza {
  let size: Int // Inches
  let toppings: [String] // Pepperoni, Mushrooms
  let style: String // Thick, Thin, Hand-tossed
}

let pizza = Pizza(size: 14, toppings: ["Pepperoni", "Mushrooms", "Anchovies"], style: "Thin")
//: ### Refactoring `isInDeliveryRange`
//: Rewrite `isInDeliveryRange` to use `Location` and `DeliveryArea`.
// The solution can be found right after the mini exercise, in the "Introducing methods" section
//: ### Refactoring `DeliveryArea`
//: 1. Change `distance(from:to:)` to use `Location`  as your parameters instead of x-y tuples.
struct Location {
  let x: Int
  let y: Int
}

func distance(from source: Location, to target: Location) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return sqrt(distanceX * distanceX + distanceY * distanceY)
}
//: 2. Change `contains(_:)` to call the new `distance(from:to:)` with `Location`.
// See below.
//: 3. Add a method `overlaps(with:)` on `DeliveryArea` that can tell you if the area overlaps with another area.
struct DeliveryArea {
  let center: Location
  var radius: Double
  
  func contains(_ location: Location) -> Bool {
    distance(from: center, to: location) < radius
  }
  
  func overlaps(with area: DeliveryArea) -> Bool {
    distance(from: center, to: area.center) <= (radius + area.radius)
  }
}

let area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
let area2 = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
area1.overlaps(with: area2) // false

let area3 = DeliveryArea(center: Location(x: 4, y: 4), radius: 2.5)
let area4 = DeliveryArea(center: Location(x: 7, y: 7), radius: 2.5)
area3.overlaps(with: area4) // true
