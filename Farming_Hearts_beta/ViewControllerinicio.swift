//
//  ViewControllerinicio.swift
//  Farming_Hearts_beta
//
//  Created by iOSLabMini03 on 09/11/24.
//

import UIKit

class ViewControllerinicio: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let curChar = UserDefaults.standard.string(forKey: "currentCharacter")
        
        UserDefaults.standard.set(nil, forKey: "currentCharacter")
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func inicio_1(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
    
    
}
