import Foundation

enum expression: Int, Codable {
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
    public let response: Response   // Cambié a Response en lugar de Bool
    public let text: String
    public let expression: expression
    public let background: String

    init(response: Response, text: String, expression: expression, background: String) {
        self.response = response
        self.text = text
        self.expression = expression
        self.background = background
    }
}

class CharacterDialogs: Codable {
    var dialogs: [Dialog]

    init(dialogs: [Dialog]) {
        self.dialogs = dialogs
    }
}

class DialogManager {
    
    public var Characters : [String: CharacterDialogs]?
    
    init(){
        self.Characters =  loadCharacters();
    }
    
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
                                                
    func deJson(characterValue: String, id: Int) -> CharacterDialogs? {
        // Uso del método
        if let characters = self.Characters {
            for (name, character) in characters {
                if characterValue == name {
                    for i in 0..<character.dialogs.count {  // Bucle correcto para iterar sobre los diálogos
                        // Verificar si el id coincide con el índice del diálogo
                        if id == i {  // Compara el id con el índice
                            return character // Regresar el objeto `CharacterDialogs`
                        }
                    }
                }
            }
        }
        return nil  // Si no se encuentra el personaje o diálogo, regresar nil
    }

}
