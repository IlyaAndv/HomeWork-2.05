import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 13
        
        userName.delegate = self
        password.delegate = self
    }
    
    @IBAction func pressButtonForgotUserName() {
        showAlert(whithTitle: "Warning!", andMessage: "Your user name is root.")
    }
    
    @IBAction func pressButtonForgotPassword() {
        showAlert(whithTitle: "Warning!", andMessage: "Your password is 123.")
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            if userName.text?.isEmpty == false {
                password.becomeFirstResponder()
            }
        }
        return true
    }

    private func showAlert(whithTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }

}
