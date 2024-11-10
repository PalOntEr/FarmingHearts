import Foundation

enum Expression: Int, Codable {
    case empty = -1    // Valor -1 asignado al caso `empty`
    case neutral = 0
    case happy = 1
    case sad = 2
    case angry = 3
    case ashamed = 4
}

enum Response: Int, Codable {
    case character = 0
    case player = 1
    case thinking = 2
}

class Dialog: Codable {
    let response: Response   // Cambié a Response en lugar de Bool
    let text: String
    let expression: Expression

    init(response: Response, text: String, expression: Expression) {
        self.response = response
        self.text = text
        self.expression = expression
    }
}

class CharacterDialogs: Codable {
    var dialogs: [Dialog]

    init(dialogs: [Dialog]) {
        self.dialogs = dialogs
    }
}

class DialogManager {
    func loadCharacters() -> [String: CharacterDialogs]? {
        guard let url = Bundle.main.url(forResource: "dialogs", withExtension: "json") else {
            print("Error: JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            // Aquí estamos decodificando un diccionario con String (nombre del personaje) como clave
            // y CharacterDialogs (que contiene dialogs) como valor
            return try decoder.decode([String: CharacterDialogs].self, from: data)
        } catch {
            print("Error loading and parsing JSON file: \(error)")
            return nil
        }
    }

    func deJson() {
        // Uso del método
        if let characters = loadCharacters() {
            for (name, character) in characters {
                print("Character: \(name)")
                for dialog in character.dialogs {
                    print("Response: \(dialog.response), Expression: \(dialog.expression), Text: \(dialog.text)")
                }
            }
        }
    }
}
