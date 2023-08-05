import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 13
    }
    
    @IBAction func pressButtonForgotUserName() {
        showAlert(whithTitle: "Warning!!", andMessage: "Your user name is root.")
    }
    
    @IBAction func pressButtonForgotPassword() {
        showAlert(whithTitle: "Warning!!", andMessage: "Your password is 123.")
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
