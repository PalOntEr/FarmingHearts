
import Foundation

struct Dialog: Codable {
    let id: Int
    let user: String
    let response: String
}

func loadDialogs() -> [Dialog]? {
    if let url = Bundle.main.url(forResource: "dialogs", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let dialogs = try decoder.decode([Dialog].self, from: data)
            return dialogs
        } catch {
            print("Error al cargar y parsear el archivo JSON: \(error)")
        }
    }
    return nil
}

// Uso del método
if let dialogs = loadDialogs() {
    for dialog in dialogs {
        print("User: \(dialog.user)")
        print("Response: \(dialog.response)")
    }
}
