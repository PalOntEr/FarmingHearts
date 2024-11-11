//
//  ViewControlleropc.swift
//  Farming_Hearts_beta
//
//  Created by iOSLabMini03 on 09/11/24.
//

import UIKit

class ViewControlleropc: UIViewController {
    
    @IBOutlet weak var AmbientBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(UserDefaults.standard.bool(forKey: "ambient")){
            AmbientBtn.alpha = 1;
        }
        else {
            AmbientBtn.alpha = 0.8;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func volver_inicio_opc(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    @IBAction func stopBkgMusic(_ sender: Any) {
        if (UserDefaults.standard.bool(forKey: "ambient")){
            AudioManager.shared.stopBackgroundMusic()
            UserDefaults.standard.set(false, forKey: "ambient")
            self.AmbientBtn.alpha = 0.8;
        }else{
            UserDefaults.standard.set(true, forKey: "ambient")
            AudioManager.shared.playBackgroundMusic("Menu")
            self.AmbientBtn.alpha = 1;
        }
    }
}
