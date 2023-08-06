import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingsTF: UILabel!
    
    var greetings: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsTF.text = greetings
    }
    
}
