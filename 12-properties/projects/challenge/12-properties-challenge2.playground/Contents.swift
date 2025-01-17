
/*:
 ## Properties Challenge 2
 
At the beginning of the chapter, you saw a `Car` structure. Dive into the inner workings of the car and rewrite the `FuelTank` structure below with property observer functionality:

```swift
 /// struct FuelTank {
 ///   var level: Double // decimal percentage between 0 and 1
 /// }
```
  1. Add a `lowFuel` stored property of Boolean type to the structure.
  2. Flip the `lowFuel` Boolean when the `level` drops below 10%.
  3. Ensure that when the tank fills back up, the `lowFuel` warning will turn off.
  4. Set the `level` to a minimum of `0` or a maximum of `1` if it gets set above or below the expected values.
  5. Add a `FuelTank` property to `Car`.
 */
struct FuelTank {

  var lowFuel: Bool
  var level: Double { // decimal percentage between 0 and 1
    didSet {
      if level < 0 {
        level = 0
      }
      if level > 1 {
        level = 1
      }
      lowFuel = level < 0.1
    }
  }
}

struct Car {
  let make: String
  let color: String
  var tank: FuelTank
}

var car = Car(make: "DeLorean", color: "Silver", tank: FuelTank(lowFuel: false, level: 1))
car.tank.level = -1 // level: 0, lowFuel: true
car.tank.level = 1.1 // level: 1, lowFuel: false
