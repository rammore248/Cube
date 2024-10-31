//
//  LoginViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit
import MBProgressHUD
import KeychainAccess

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var hud: MBProgressHUD?
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var trimmedIdTextField: String = ""
    var trimmedPasswordTextField: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        IDTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(uIdPwdResponseCheck(_:)),
                                               name: NSNotification.Name(APIConstants.NOTIFICATION_AUTHENTICATE_API),
                                               object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func uIdPwdResponseCheck(_ notification: Notification) {
        guard let dict = notification.object as? [String: Any],
              let responseCodeString = dict[APIConstants.RESPONSE_CODE] as? String else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        hud?.hide(animated: true)
        
        if let responseCode = Int(responseCodeString) {
            if responseCode == -1001 || responseCode == 2001 {
                // Error occurred
            } else if responseCode == 200 {
                UserDefaults.standard.setValue(trimmedIdTextField, forKey: APIConstants.USER_ID)
                UserDefaults.standard.setValue(trimmedPasswordTextField, forKey: APIConstants.USER_PASS)
                
                if let regiController = storyboard.instantiateViewController(withIdentifier: "PinGenVC") as? PinRegistrationViewController {
                    passwordTextField.resignFirstResponder()
                    regiController.modalPresentationStyle = .fullScreen
                    self.present(regiController, animated: false, completion: nil)
                }
            } else if responseCode == 401 {
                
                
                IDTextField.text = nil
                passwordTextField.text = nil
            }
        }
    }

    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if IDTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            
            let title = "Incomplete Data"
            let message = "Id or password cannot be null"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(actionOk)
            performSegue(withIdentifier: "PinGenVC", sender: self)
            present(alertController, animated: true, completion: nil)
        } else {
            if AppPreferences.shared.isReachable {
                hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                hud?.minSize = CGSize(width: 150.0, height: 100.0)
                hud?.label.text = "Validating..."
                hud?.detailsLabel.text = "Please wait"
                
            }
        }
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
