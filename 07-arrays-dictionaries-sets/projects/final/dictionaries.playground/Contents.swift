
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)
// > ["Craig": 8, "Anna": 2, "Donna": 6, "Brian": 2]

namesAndScores = [:]

var pairs: [String: Int] = [:]

pairs.reserveCapacity(20)

// --------------------
// | ACCESSING VALUES |
// --------------------

namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
// Restore the values

print(namesAndScores["Anna"]!) // 2

namesAndScores["Greg"] // nil

namesAndScores.isEmpty // false

namesAndScores.count // 4

Array(namesAndScores.keys) // ["Craig", "Anna", "Donna", "Brian"]
Array(namesAndScores.values) // [8, 2, 6, 2]

// -----------------
// | ADDING VALUES |
// -----------------

var bobData = ["name": "Bob", "profession": "Card Player", "country": "USA"]

bobData.updateValue("CA", forKey: "state")

bobData["city"] = "San Francisco"

// -------------------
// | UPDATING VALUES |
// -------------------

bobData.updateValue("Bobby", forKey: "name")

bobData["profession"] = "Mailman"

bobData.removeValue(forKey: "state")

bobData["city"] = nil

// -------------
// | ITERATION |
// -------------

for (player, score) in namesAndScores {
  print("\(player) - \(score)")
}
// > Craig - 8
// > Anna - 2
// > Donna - 6
// > Brian - 2

for player in namesAndScores.keys {
  print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > Craig, Anna, Donna, Brian,
