//
//  PinLoginViewController.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 21/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var pinTextField1: UITextField!
    @IBOutlet weak var pinTextField2: UITextField!
    @IBOutlet weak var pinTextField3: UITextField!
    @IBOutlet weak var pinTextField4: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
    }
    

    func showAlert(_ message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Ensure only one digit can be entered
        if string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
            return false
        }
        
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        
        if newLength == 1 {
            textField.text = string // Set the text field's text
            
            // Move to the next text field with a slight delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.moveToNextTextField(from: textField)
            }
            return false
        } else if newLength == 0 {
            // Handle backspace by allowing the deletion and moving to the previous text field
            textField.text = ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.moveToPreviousTextField(from: textField)
            }
            return false
        }
        
        return false
    }
    
    private func moveToNextTextField(from textField: UITextField) {
        
    }
    
    private func moveToPreviousTextField(from textField: UITextField) {
        
    }
}
