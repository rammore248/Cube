//
//  SplashScreenViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class SplashScreenViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func checkDeviceRegistration() {
        
    }
    
    func addAlertView() {
       
    }
    
    @objc func refresh(_ sender: UIButton) {
        
    }
    
    @objc func goOfflineButtonClicked(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.viewWithTag(222)?.removeFromSuperview()
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RecordViewController") {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }
    
    @objc func removeAlertView() {
        
    }
}
