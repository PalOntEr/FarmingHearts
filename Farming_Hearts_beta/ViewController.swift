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
        
        AudioManager.shared.playBackgroundMusic("Menu")
        
        UserDefaults.standard.set(true, forKey: "ambient")
        UserDefaults.standard.set(true, forKey: "music")
        
    }


}

