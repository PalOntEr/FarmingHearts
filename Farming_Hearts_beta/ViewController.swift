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
        dialogManager.deJson()
        // Do any additional setup after loading the view.
    }


}

