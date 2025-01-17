
/*:
 ## Classes
 ### Challenge 1

 Imagine you're writing a movie-viewing application in Swift. Users can create lists of movies and share those lists with other users.
 
 Create a `User` and a `List` class that uses reference semantics to help maintain lists between users.
 
 - `User` - Has a method `addList(_:)` which adds the given list to a dictionary of `List` objects (using the `name` as a key), and `list(forName:) -> List?` which will return the `List` for the provided name.
 - `List` - Contains a name and an array of movie titles. A `report` method will print all the movies in the list.
 - Create `jane` and `john` users and create a list that they share. Have both `jane` and `john` modify the list and call `report` from both users. Are all the changes reflected?
*/
class User {
  var lists: [String: List] = [:]

  func addList(_ list: List) {
    lists[list.name] = list
  }

  func list(forName name: String) -> List? {
    lists[name]
  }
}

class List {
  let name: String
  var movies: [String] = []

  init(name: String) {
    self.name = name
  }

  func report() {
    print("Movie List: \(name)")
    for movie in movies {
      print(movie)
    }
    print("\n")
  }
}

// Give John and Jane an "Action" list
let jane = User()
let john = User()
var actionList = List(name: "Action")

jane.addList(actionList)
john.addList(actionList)

// Add Jane's favorites
jane.lists["Action"]?.movies.append("Rambo")
jane.lists["Action"]?.movies.append("Terminator")

// Add John's favorites
john.lists["Action"]?.movies.append("Die Hard")

// See John's list:
john.lists["Action"]?.report()

// See Jane's list:
jane.lists["Action"]?.report()
/*:
 What happens when you implement the same with structs and what problems do you run into?
 */
 // Solution: With structs and copy semantics, once John and Jane get the Action list via `addList(_:)`, they each get a copy instead of sharing the same list. That way, when one adds a movie - the other doesn't see it!
/*:
 ### Challenge 2
 
 Your challenge here is to build a set of entities to support a t-shirt store. Decide if each entity should be a class or a struct, and why.
 
 - `TShirt` - Represents a shirt style you can buy. Each `TShirt` has a size, color, price, and an optional image on the front.
 - `User` - A registered user of the t-shirt store app. A user has a name, email, and a `ShoppingCart` (below).
 - `Address` - This represents a shipping address, containing the name, street, city, and zip code.
 - `ShoppingCart` - Holds a current order, which is composed of an array of `TShirt` that the `User` wants to buy, as well as a method to calculate the total cost. Additionally, there is an `Address` that represents where the order will be shipped.
*/
/*
 Solution:

 - TShirt: A TShirt can be thought of as a value, because it doesn't represent a real shirt, only a description of a shirt. For instance, a TShirt would represent "a large green shirt order" and not "an actual large green shirt". For this reason, TShirt can be a struct instead of a class.
 - User: A User represents a real person. This means every user is unique so User is best implemented as a class.
 - Address: Addresses group multiple values together and two addresses can be considered equal if they hold the same values. This means Address works best as a value type (struct).
 - ShoppingCart: The ShoppingCart is a bit tricker. While it could be argued that it could be done as a value type, it's best to think of the real world semantics you are modeling. If you add an item to a shopping cart, would you expect to get a new shopping cart? Or put the new item in your existing cart? By using a class, the reference semantics help model real world behaviors. Using a class also makes it easier to share a single ShoppingCart object between multiple components of your application (shopping, ordering, invoicing, ...).
 */
