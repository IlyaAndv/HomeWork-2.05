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
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard loginTF.text == "root", passwordTF.text == "123" else {
            showAlert(
                whithTitle: "Invalid login or password!",
                andMessage: "Please, enter correct login or password",
                andWithAssignment: "Сlear password field"
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? WelcomeViewController
        
        settingsVC?.greeting = "Wellcom, \(loginTF.text ?? "")"
    }

// MARK: - IB Actions
    @IBAction func pressButtonForgotLogin() {
        showAlert(whithTitle: "Warning!",
                  andMessage: "Your login is root.",
                  andWithAssignment: nil)
    }
    
    @IBAction func pressButtonForgotPassword() {
        showAlert(whithTitle: "Warning!",
                  andMessage: "Your password is 123.",
                  andWithAssignment: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
// MARK: - Private method
    private func showAlert(
        whithTitle title: String,
        andMessage message: String,
        andWithAssignment assignment: String?
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        switch assignment {
        case "Сlear password field":
            alert.addAction(
                UIAlertAction(title: "Repeat", style: .default) { _ in
                    self.passwordTF.text = ""
                }
            )
        default: alert.addAction(UIAlertAction(title: "OK", style: .default))
        }
        
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTF: passwordTF.becomeFirstResponder()
        default: logInButton.sendActions(for: .touchUpInside)
        }
        
        return true
    }
}
