// -------------------
// | Mini Challanges |
// -------------------

// Use index(of:) to determine the position of the element "Dan" in players.

var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]

print(players.firstIndex(of: "Dan")!)


// Write a for-in loop that prints the players' names and scores.

players = ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]
let scores = [2, 2, 8, 6, 1, 2, 1]

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player) - \(scores[index])")
}

// Write a function that prints a given player's city and state

var bob = ["name": "Bob",
           "profession": "Card Player",
           "country": "USA",
           "state": "CA",
           "city": "San Francisco"]

func printLocation(ofPlayer player: [String: String]) {
  if let state = player["state"], let city = player["city"] {
    print("Player lives in \(city), \(state)")
  }
}

printLocation(ofPlayer: bob)
