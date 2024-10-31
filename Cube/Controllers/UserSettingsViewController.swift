//
//  UserSettingsViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class UserSettingsViewController: UIViewController {
    
    @IBAction func changePinButtonTapped(_ sender: UIButton) {
        // Navigate to Change PIN screen
        performSegue(withIdentifier: "toChangePinScreen", sender: self)
    }
}
