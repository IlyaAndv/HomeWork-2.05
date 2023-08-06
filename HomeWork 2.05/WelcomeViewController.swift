import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingTF: UILabel!
    
    var greeting: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingTF.text = greeting
    }
    
}
