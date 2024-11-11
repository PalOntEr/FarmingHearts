//
//  ViewController.swift
//  Farming_Hearts_beta
//
//  Created by iOSLabMini03 on 09/11/24.
//

import UIKit

class ViewControllerConversation: UIViewController {

    var messageId = 0;
    var curChar: String? = "Jefe";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.curChar = UserDefaults.standard.string(forKey: "currentCharacter");
        print(self.curChar ?? "curChar was not set");
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        messageId += 1;
        print("Next Message:\(messageId)");
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }

}

