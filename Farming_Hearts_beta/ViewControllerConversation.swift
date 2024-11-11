//
//  ViewController.swift
//  Farming_Hearts_beta
//
//  Created by iOSLabMini03 on 09/11/24.
//

import UIKit

class ViewControllerConversation: UIViewController {

    @IBOutlet weak var Character: UIImageView!
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var NameBox: UIImageView!
    
    @IBOutlet weak var Text: UILabel!
    @IBOutlet weak var TextBox: UIImageView!
    
    let dialogManager = DialogManager()
    
    var messageId = 0;
    var curChar: String? = "Jefe";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.curChar = UserDefaults.standard.string(forKey: "currentCharacter");
        
        loadMessage(characterValue: self.curChar ?? "", id: messageId);

        print(self.Character ?? "Character was not set")
        print(self.curChar ?? "curChar was not set");
        // Do any additional setup after loading the view.
    }
    
    private func loadMessage(characterValue: String, id: Int){
        if let dialog = dialogManager.deJson(characterValue: characterValue, id: id) {
            // Accede al diálogo específico por su índice
            if id < dialog.dialogs.count {
                let dialogItem = dialog.dialogs[id]
                
                Name.text = "Oliver";
                
                if(dialogItem.response == Response.character){
                    Name.text = curChar;
                    NameBox.image = UIImage(named: "PinkBox");
                    TextBox.image = UIImage(named: "PinkBox");
                }
                else if (dialogItem.response == Response.thinking){
                    NameBox.image = UIImage(named: "GrayBox")
                    TextBox.image = UIImage(named: "GrayBox")
                }
                else {
                    NameBox.image = UIImage(named: "BlueBox")
                    TextBox.image = UIImage(named: "BlueBox")
                }
                
                Text.text = dialogItem.text;
                print("Response: \(dialogItem.response), Expression: \(dialogItem.expression), Text: \(dialogItem.text)")
            }
        } else {
            print("No se encontró el personaje o el diálogo.")
            self.back(self);
        }
    }
    
    @IBAction func next(_ sender: Any) {
        self.messageId += 1;
        
        loadMessage(characterValue: self.curChar ?? "Jefe", id: self.messageId)
        
        print("Next Message:\(messageId)");
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }

}

