//
//  ViewController.swift
//  Farming_Hearts_beta
//
//  Created by iOSLabMini03 on 09/11/24.
//

import UIKit

class ViewController: UIViewController {

    let dialogManager = DialogManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentId = 1;
        
        if let dialog = dialogManager.deJson(characterValue: "Jefe", id: currentId) {
            // Accede al diálogo específico por su índice
            if currentId < dialog.dialogs.count {
                let dialogItem = dialog.dialogs[currentId]
                print("Response: \(dialogItem.response), Expression: \(dialogItem.expression), Text: \(dialogItem.text)")
            }
        } else {
            print("No se encontró el personaje o el diálogo.")
        }


        // Do any additional setup after loading the view.
    }


}

