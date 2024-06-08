import Foundation

// Define a struct for representing a character in CodeRealm
struct Character {
    let name: String
    let puzzle: String
    let solution: String
}

// Define an array of characters with their respective puzzles and solutions
let characters: [Character] = [
    Character(name: "Byte", puzzle: "What is the output of 'print(2 + 2)'?", solution: "4"),
    Character(name: "Wizard", puzzle: "Write a function to double a given number.", solution: """
    func doubleNumber(_ number: Int) -> Int {
        return number * 2
    }
    """)
    // Add more characters and puzzles as needed
]

// Function to interact with a character and solve their puzzle
func interactWithCharacter(_ character: Character) {
    print("Welcome to CodeRealm, \(character.name)!")
    print("Here's your puzzle:")
    print(character.puzzle)
    
    // Wait for player input and check if it matches the solution
    print("Enter your solution:")
    if let userInput = readLine(), userInput == character.solution {
        print("Congratulations! You solved the puzzle!")
    } else {
        print("Sorry, that's not correct. Keep trying!")
    }
}

// Main game loop
func main() {
    print("Welcome to CodeQuest: The Swift Adventure!")
    print("Embark on a journey through CodeRealm and solve programming puzzles to save the realm from destruction.")
    
    // Interact with each character in the game
    for character in characters {
        interactWithCharacter(character)
    }
    
    print("Thanks for playing CodeQuest: The Swift Adventure!")
}

// Start the game
main()
