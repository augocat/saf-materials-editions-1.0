import Foundation

var multiplyClosureA: (Int, Int) -> Int

//================================================================
multiplyClosureA = { (a: Int, b: Int) -> Int in
  return a * b
}

//================================================================
let resultA = multiplyClosureA(4, 2)

//================================================================
var multiplyClosureB: (Int, Int) -> Int
 multiplyClosureB = { (a: Int, b: Int) -> Int in
  a * b
}
let resultB = multiplyClosureB(4, 2)


//================================================================
var multiplyClosureC: (Int, Int) -> Int
multiplyClosureC = { (a, b) in a * b }
let resultC = multiplyClosureC(4, 2)


//================================================================
var multiplyClosureD: (Int, Int) -> Int
multiplyClosureD = {
  $0 * $1
}
let resultD = multiplyClosureD(4, 2)


//================================================================
func operateOnNumbersA(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}

//================================================================
let addClosureA = { (a: Int, b: Int) in
  a + b
}
operateOnNumbersA(4, 2, operation: addClosureA)

//================================================================
func addFunctionB(_ a: Int, _ b: Int) -> Int {
  a + b
}
operateOnNumbersA(4, 2, operation: addFunctionB)

//================================================================
operateOnNumbersA(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})

//================================================================
operateOnNumbersA(4, 2, operation: { $0 + $1 })

//================================================================
operateOnNumbersA(4, 2, operation: +)


//================================================================
operateOnNumbersA(4, 2) {
  $0 + $1
}

//================================================================
func sequenced(first: ()->Void, second: ()->Void) {
  first()
  second()
}

//================================================================
sequenced {
  print("Hello, ", terminator: "")
} second: {
  print("world.")
}

//================================================================
let voidClosure: () -> Void = {
  print("Swift Apprentice is awesome!")
}
voidClosure()

//================================================================
var counter = 0
let incrementCounter = {
  counter += 1
}

//================================================================
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

//================================================================
func countingClosure() -> () -> Int {
  var counter = 0
  let incrementCounter: () -> Int = {
    counter += 1
    return counter
  }
  return incrementCounter
}

//================================================================
let counter1 = countingClosure()
let counter2 = countingClosure()

counter1() // 1
counter2() // 1
counter1() // 2
counter1() // 3
counter2() // 2

//================================================================
let namesA = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
namesA.sorted()
// ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]

//================================================================
namesA.sorted {
  $0.count > $1.count
}
// ["ZZZZZZ", "EEEEE", "CCCC", "BB", "A"]

//================================================================
let values = [1, 2, 3, 4, 5, 6]
values.forEach {
  print("\($0): \($0*$0)")
}

//================================================================
var prices = [1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
  $0 > 5
}

//================================================================
//func filter(_ isIncluded: (Element) -> Bool) -> [Element]

//================================================================
let largePrice = prices.first {
  $0 > 5
}

//================================================================
let salePrices = prices.map {
  $0 * 0.9
}

//================================================================
let userInput = ["0", "11", "haha", "42"]

let numbers1 = userInput.map {
  Int($0)
}

//================================================================
let numbers2 = userInput.compactMap {
  Int($0)
}

//================================================================
let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let allUserInput = userInputNested.flatMap {
  $0
}

//================================================================
let sum = prices.reduce(0) {
  $0 + $1
}

//================================================================
let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
  $0 + $1.key * Double($1.value)
}

//================================================================
let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) {
  (result, this: (key: String, value: Int)) in
  for _ in 0 ..< this.value {
    result.append(this.key)
  }
}

//================================================================
var removeFirst = prices.dropFirst()
var removeFirstTwo = prices.dropFirst(2)

//================================================================
removeFirst = [10, 4.99, 2.30, 8.19]
removeFirstTwo = [4.99, 2.30, 8.19]

//================================================================
var removeLast = prices.dropLast()
var removeLastTwo = prices.dropLast(2)


//================================================================
removeLast = [1.5, 10, 4.99, 2.30]
removeLastTwo = [1.5, 10, 4.99]

//================================================================
var firstTwo = prices.prefix(2)
var lastTwo = prices.suffix(2)


//================================================================
firstTwo
lastTwo


//================================================================
prices.removeAll() { $0 > 2 } // prices is now [1.5]
prices.removeAll() // prices is now an empty array


//================================================================
func isPrime(_ number: Int) -> Bool {
  if number == 1 { return false }
  if number == 2 || number == 3 { return true }

  for i in 2...Int(Double(number).squareRoot()) {
    if number % i == 0 { return false }
  }

  return true
}

var primes: [Int] = []
var i = 1
while primes.count < 10 {
  if isPrime(i) {
    primes.append(i)
  }
  i += 1
}
primes.forEach { print($0) }


//================================================================
let primesB = (1...).lazy
  .filter { isPrime($0) }
  .prefix(10)
primesB.forEach { print($0) }


// Mini-Exercises 1 ================================================================
let names = ["Bill", "Ben", "Geoff", "Phill", "Kim", "Cate"]
let allNames = names.reduce("") {
  $0 + $1
}
// Mini-Exercises 2 ================================================================
let longerThanFourNames = names.filter {
  $0.count > 4
}.reduce("") {
  $0 + $1
}

// Mini-Exercises 3 ================================================================
let namesAndAges = ["Bill": 39, "Ben": 30, "Geoff": 17, "Phill": 25, "Kim": 23, "Cate": 16]
let underEighteenYearsOld = namesAndAges.filter {
  $0.value < 18
}
// Mini-Exercises 4 ================================================================
let eighteenYearsOrMore = namesAndAges.filter {
  $0.value >= 18
}
  eighteenYearsOrMore.keys

// Challenge 1: Repeating Yourself ================================================================
func repeatTask(times: Int, task: () -> Void) {
  for c in 1...times {
    task()
  }
}
repeatTask(times: 115) {
  print("Swift Apprentice is a great book!")
}

// Challenge 2: Closure Sums ================================================================
func mathSum(length: Int, series: (Int) -> Int) -> Int {
  var sum = 0
  for c in 1...length {
    sum += series(c)
  }
  return sum
}
mathSum(length: 10) {
  $0 * $0
}

func fibonacci(_ number: Int) -> Int {
  if number < 1 {
    return 0
  }
  if number == 1 || number == 2 {
    return 1
  }
  return fibonacci(number - 1) + fibonacci(number - 2)
}

mathSum(length: 10) {
  fibonacci($0)
}

// Challenge 3: Functional Ratings ================================================================
let appRatings = [
  "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
  "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
  "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
var averageRatings : [String : Int] = [:]
for ratings in appRatings {
  averageRatings[ratings.key] = ratings.value.reduce(0) {
    $0 + $1
  }
}
averageRatings





//================================================================

//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================


//================================================================














