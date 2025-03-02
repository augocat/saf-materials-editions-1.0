var name = "Matt Galloway"
var age = 30
var occupation = "Software Developer & Author"

//================================================================
var errorCode = 0

//================================================================
var errorCodeB: Int?
errorCodeB
//================================================================
errorCodeB = 100
errorCodeB
//================================================================
errorCodeB = nil
errorCodeB
//================================================================
//Mini-Exercise
var myFavoriteSong: String?
myFavoriteSong
let parsedInt = Int("10")
parsedInt
let parsedIntB = Int("")
parsedIntB

//================================================================
var result: Int? = 30
print(result)

//================================================================
//print(result + 1)

//================================================================
var authorNameA: String? = "Matt GallowayA"
var authorAge: Int? = 30

//================================================================
var unwrappedAuthorNameA = authorNameA!
print("Author is \(unwrappedAuthorNameA)")

//================================================================
//authorName = nil
//print("Author is \(authorName!)")

//================================================================
var authorNameB: String? = "Matt GallowayB"
if authorNameB != nil {
  print("Author is \(authorNameB!)")
} else {
  print("No author.")
}

//================================================================
var authorNameC: String? = "Matt GallowayC"
if let unwrappedAuthorNameC = authorNameC {
  print("Author is \(unwrappedAuthorNameC)")
} else {
  print("No author.")
}


//================================================================
var authorNameD: String? = "Matt GallowayD"
if let authorNameD = authorNameD {
  print("Author is \(authorNameD)")
} else {
  print("No author.")
}

//================================================================
var authorNameE: String? = "Matt GallowayE"
var authorAgeE: Int? = 31
if let authorNameE = authorNameE,
   let authorAgeE = authorAgeE {
  print("The author is \(authorNameE) who is \(authorAgeE) years old.")
} else {
  print("No author or no age.")
}

//================================================================
var authorNameF: String? = "Matt GallowayF"
var authorAgeF: Int? = 32
if let authorNameF = authorNameF,
   let authorAgeF = authorAgeF,
   authorAgeF >= 40 {
  print("The author is \(authorNameF) who is \(authorAgeF) years old.")
} else {
  print("No author or no age or age less than 40.")
}

//================================================================
var authorNameG: String? = "Matt GallowayG"
if let authorNameG = authorNameG {
  print("The author is \(authorNameG)")
}

//================================================================
var authorNameH: String? = "Matt GallowayH"
if let authorNameH {
  print("The author is \(authorNameH)")
}

//================================================================
var authorNameI: String? = "Matt GallowayI"
var authorAgeI: Int? = 32
if let authorNameI, let authorAgeI {
  print("The author is \(authorNameI) who is \(authorAgeI) years old.")
}

//================================================================
//Mini-Exercise
myFavoriteSong = "Looking through the Mirror"
if let myFavoriteSong {
  print(myFavoriteSong)
} else {
  print("I don’t have a favorite song.")
}

//================================================================
func guardMyCastle(name: String?) {
  guard let castleName = name else {
    print("No castle!")
    return
  }

  // At this point, `castleName` is a non-optional String

  print("Your castle called \(castleName) was guarded!")
}

//================================================================
func calculateNumberOfSides(shape: String) -> Int? {
  switch shape {
  case "Triangle":
    return 3
  case "Square":
    return 4
  case "Rectangle":
    return 4
  case "Pentagon":
    return 5
  case "Hexagon":
    return 6
  default:
    return nil
  }
}

//================================================================
func maybePrintSides(shape: String) {
  let sides = calculateNumberOfSides(shape: shape)

  if let sides = sides {
    print("A \(shape) has \(sides) sides.")
  } else {
    print("I don’t know the number of sides for \(shape).")
  }
}

//================================================================
func maybePrintSidesB(shape: String) {
  guard let sides = calculateNumberOfSides(shape: shape) else {
    print("I don’t know the number of sides for \(shape).")
    return
  }

  print("A \(shape) has \(sides) sides.")
}
maybePrintSidesB(shape: "Triangle")
//================================================================
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0

print(mustHaveResult)
//================================================================
//var optionalIntB: Int? = 10
//var mustHaveResultB: Int
//if let unwrappedB = optionalIntB {
//  mustHaveResultB = unwrappedB
//} else {
//  mustHaveResultB = 0
//}
//print(mustHaveResultB)
//================================================================
optionalInt = nil
mustHaveResult = optionalInt ?? 0
print(mustHaveResult)
//Challenge 1================================================================
var nameB: String? = "Ray" //VALID
//var ageB: Int = nil //INVALID
let distance: Float = 26.7 //VALID
var middleName: String? = nil //VALID

// Challenge 2 ================================================================
func divideIfWhole(intUpper: Int, intLower: Int) -> Int? {
  let remainder = intUpper % intLower
  let quotient = intUpper / intLower
  if remainder != 0 {
    return nil
  } else {
    return quotient
  }
}

func tryTwoNumbers(upperInt: Int, lowerInt: Int) {
  if let divideIfWhole = divideIfWhole(intUpper: upperInt, intLower: lowerInt) {
    print("Yep, it divides \(divideIfWhole) times.")
  } else {
    print("Not divisible :[.")
  }
}

tryTwoNumbers(upperInt: 10, lowerInt: 2)
tryTwoNumbers(upperInt: 10, lowerInt: 3)


// Challenge 3 ================================================================

let ans1 = divideIfWhole(intUpper: 10, intLower: 2) ?? 0
print("It divides \(ans1) times.")

let ans2 = divideIfWhole(intUpper: 10, intLower: 3) ?? 0
print("It divides \(ans2) times.")


// Challenge 4 ================================================================
let number: Int??? = 10

print(number)
// Optional(Optional(Optional(10)))

print(number!)
// Optional(Optional(10))

print(number!!!)

if let number, let number, let number {
  print(number)
}

func printNumber(_ number: Int???) {
  guard let number, let number, let number else {
    
    return
  }
  print(number)
}

printNumber(number)




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
