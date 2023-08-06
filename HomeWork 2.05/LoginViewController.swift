import UIKit

final class LoginViewController: UIViewController {

// MARK: - IB Outlets
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!

// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 13
        
        loginTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard loginTF.text == "root", passwordTF.text == "123" else {
            showAlertForInvalidPassOrLog(
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

// MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func pressButtonForgotLogin() {
        showAlertBut(whithTitle: "Warning!",andMessage: "Your login is root.")
    }
    
    @IBAction func pressButtonForgotPassword() {
        showAlertBut(whithTitle: "Warning!",andMessage: "Your password is 123.")
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTF: passwordTF.becomeFirstResponder()
        default:
            loginTF.becomeFirstResponder()
            logInButton.sendActions(for: .touchUpInside)
        }
        return true
    }
}

// MARK: - Alert methods
extension LoginViewController {
    private func showAlertBut(
        whithTitle title: String,
        andMessage message: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    private func showAlertForInvalidPassOrLog(
        whithTitle title: String,
        andMessage message: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default) {
                _ in self.passwordTF.text = ""
            }
        )
        
        present(alert, animated: true)
    }
}
