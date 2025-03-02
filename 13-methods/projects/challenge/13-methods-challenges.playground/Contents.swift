
/*:
 
 ## Method Challenges
 ### Challenge 1

 Given the `Circle` structure:
 
```swift
/// struct Circle {
///
///   var radius = 0.0
///
///   var area: Double {
///     .pi * radius * radius
///   }
/// }
```
 
 Write a method that can change an instance's area by a growth factor. For example if you call `circle.grow(byFactor: 3)`, the area of the instance will triple.
 
 Hint: Add a setter to `area`.
*/
struct Circle {
  
  var radius = 0.0

  var area: Double {
    get {
      .pi * radius * radius
    }
    set {
      radius = (newValue / .pi).squareRoot()
    }
  }

  mutating func grow(byFactor factor: Double) {
    area *= factor
  }
  
}

var circle = Circle(radius: 5)
circle.area // 78.54
circle.grow(byFactor: 3)
circle.area // 235.62

/*:
 ### Challenge 2
 
 Here is a naïve way of writing `advance()` for the `SimpleDate` structure you saw earlier in the chapter:
 
 ```swift
/// let months = ["January", "February", "March",
///               "April", "May", "June",
///              "July", "August", "September",
///              "October", "November", "December"]
///
/// struct SimpleDate {
///   var month: String
///   var day: Int
///
///  mutating func advance() {
///     day += 1
///  }
/// }
///
/// var date = SimpleDate(month: "December", day: 31)
/// date.advance()
/// date.month // December; should be January!
/// date.day // 32; should be 1!
```
 
 What happens when the function should go from the end of one month to the start of the next? Rewrite `advance()` to account for advancing from December 31st to January 1st.
*/
let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
  var month: String
  var day: Int
  
  var totalDaysInCurrentMonth: Int {
    switch month {
    case "January", "March", "May", "July", "August", "October", "December":
      return 31
    case "April", "June", "September", "November":
      return 30
    case "February": // Note: leap years aren't taken into account here.
      return 28
    default:
      return 0
    }
  }
  
  mutating func advance() {
    // Check for the end of the month
    if day == totalDaysInCurrentMonth {
      // Check for the end of the year
      if month == "December" {
        month = "January"
      } else {
        // Increment the month
        month = months[months.firstIndex(of: month)!.advanced(by: 1)]
      }
      // Start over at the first day of the month
      day = 1
    } else {
      // It is not the end of the month, just increment the day
      day += 1
    }
  }
}

var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // January
date.day // 1
/*:
 ### Challenge 3
 Add type methods named `isEven` and `isOdd` to your `Math` namespace that return `true` if a number is even or odd respectively.
 */
struct Math {}

extension Math {
  static func isEven(_ value: Int) -> Bool {
    value % 2 == 0
  }
  static func isOdd(_ value: Int) -> Bool {
    (value + 1) % 2 == 0
  }
}

Math.isOdd(30) // false
Math.isOdd(33) // true
Math.isEven(20) // true
Math.isEven(21) // false
/*:
 ### Challenge 4
 It turns out that `Int` is simply a struct.  Add the computed properties `isEven` and `isOdd` to `Int` using an extension.
 
 > Generally, you want to be careful about what functionality you add to standard library types as it can cause confusion for readers.
 */
extension Int {
  var isEven: Bool {
    self % 2 == 0
  }
  var isOdd: Bool {
    (self + 1) % 2 == 0
  }
}

2.isEven // true
3.isEven // false
2.isOdd  // false
3.isOdd  // true
/*:
 ### Challenge 5
Add the method `primeFactors()` to `Int`. Since this is an expensive operation, this is best left as an actual method.
*/
extension Int {
  func primeFactors() -> [Int] {
    var remainingValue = self
    var testFactor = 2
    var primes: [Int] = []
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      }
      else {
        testFactor += 1
      }
    }
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}

81.primeFactors() // [3, 3, 3, 3]
18.primeFactors() // [2, 3, 3]
57.primeFactors() // [3, 19]


