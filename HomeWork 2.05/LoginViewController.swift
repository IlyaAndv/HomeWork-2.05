import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 13
        
        loginTF.delegate = self
        passwordTF.delegate = self
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard loginTF.text == "root", passwordTF.text == "123" else {
            showAlert(
                whithTitle: "Invalid login or password!",
                andMessage: "Please, enter correct login or password"
            )
            
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? WelcomeViewController
        settingsVC?.greetings = "Wellcom, \(loginTF.text ?? "")"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func pressButtonForgotUserName() {
        showAlert(whithTitle: "Warning!", andMessage: "Your user name is root.")
    }
    
    @IBAction func pressButtonForgotPassword() {
        showAlert(whithTitle: "Warning!", andMessage: "Your password is 123.")
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTF: passwordTF.becomeFirstResponder()
        default: print("true")
        }
        return true
    }

    private func showAlert(whithTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.loginTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }

}
