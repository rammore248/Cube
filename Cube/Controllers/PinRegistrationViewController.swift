import UIKit

class PinRegistrationViewController: UIViewController {
    
    @IBOutlet weak var pincode1TextField: UITextField!
    @IBOutlet weak var pincode2TextField: UITextField!
    @IBOutlet weak var pincode3TextField: UITextField!
    @IBOutlet weak var pincode4TextField: UITextField!
    @IBOutlet weak var pincode5TextField: UITextField!
    @IBOutlet weak var pincode6TextField: UITextField!
    @IBOutlet weak var pincode7TextField: UITextField!
    @IBOutlet weak var pincode8TextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pincode1TextField.delegate = self
        pincode2TextField.delegate = self
        pincode3TextField.delegate = self
        pincode4TextField.delegate = self
        pincode5TextField.delegate = self
        pincode6TextField.delegate = self
        pincode7TextField.delegate = self
        pincode8TextField.delegate = self
        
        // Set keyboard type to number pad
        [pincode1TextField, pincode2TextField, pincode3TextField, pincode4TextField,
         pincode5TextField, pincode6TextField, pincode7TextField, pincode8TextField].forEach {
            $0?.keyboardType = .numberPad
        }
        
    }
    @IBAction func submitTapped(_ sender: UIButton) {
    
        let pinCode = "\(pincode1TextField.text ?? "")\(pincode2TextField.text ?? "")\(pincode3TextField.text ?? "")\(pincode4TextField.text ?? "")"
        let confirmPinCode = "\(pincode5TextField.text ?? "")\(pincode6TextField.text ?? "")\(pincode7TextField.text ?? "")\(pincode8TextField.text ?? "")"
        
        if isInputValid(pinCode: pinCode, confirmPinCode: confirmPinCode) {
            // Save PIN to UserDefaults
            UserDefaults.standard.set(pinCode, forKey: "userPin")
            
            // Show success alert
            showAlert("PIN Registered successfully!")
            
            // Navigate to PinLoginViewController
            let loginPinVC = LoginViewController()
            
            self.present(loginPinVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func isInputValid(pinCode: String, confirmPinCode: String) -> Bool {
        guard pinCode.count == 4 && confirmPinCode.count == 4 else {
            showAlert("PIN and confirmation PIN must each be 4 digits long.")
            return false
        }
        
        guard pinCode == confirmPinCode else {
            showAlert("PIN and confirmation PIN do not match.")
            return false
        }
        
        return true
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "PIN Registration", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
extension PinRegistrationViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Ensure only one digit can be entered
        if string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
            // If the input is not a digit, reject the input
            return false
        }
        
        // Get the current text of the text field
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        
        // Allow input only if it's a single character
        if newLength == 1 {
            textField.text = string // Set the text field's text
            
            // Move to the next text field
            moveToNextTextField(from: textField)
            return false
        } else if newLength == 0 {
            // Handle backspace by allowing the deletion and staying in the current field
            textField.text = ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.moveToPreviousTextField(from: textField)
            }
            return false
        }
        
        return false // Don't allow more than 1 digit
    }

    private func moveToNextTextField(from textField: UITextField) {
        switch textField {
        case pincode1TextField:
            pincode2TextField.becomeFirstResponder()
        case pincode2TextField:
            pincode3TextField.becomeFirstResponder()
        case pincode3TextField:
            pincode4TextField.becomeFirstResponder()
        case pincode4TextField:
            pincode5TextField.becomeFirstResponder()
        case pincode5TextField:
            pincode6TextField.becomeFirstResponder()
        case pincode6TextField:
            pincode7TextField.becomeFirstResponder()
        case pincode7TextField:
            pincode8TextField.becomeFirstResponder()
        case pincode8TextField:
            textField.resignFirstResponder() // Dismiss the keyboard when the last field is filled
        default:
            break
        }
    }
    
    private func moveToPreviousTextField(from textField: UITextField) {
        switch textField {
        case pincode2TextField:
            pincode1TextField.becomeFirstResponder()
        case pincode3TextField:
            pincode2TextField.becomeFirstResponder()
        case pincode4TextField:
            pincode3TextField.becomeFirstResponder()
        case pincode5TextField:
            pincode4TextField.becomeFirstResponder()
        case pincode6TextField:
            pincode5TextField.becomeFirstResponder()
        case pincode7TextField:
            pincode6TextField.becomeFirstResponder()
        case pincode8TextField:
            pincode7TextField.becomeFirstResponder()
        default:
            break
        }
    }
}
