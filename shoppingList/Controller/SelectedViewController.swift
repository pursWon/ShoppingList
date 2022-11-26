import Foundation
import UIKit

protocol Sampleprotocol {
    func dataSend(data: String)
}

class SelectedViewController: UIViewController {
    // MARK: - Properties
    var text: String = ""
    var delegate: Sampleprotocol?
    // MARK: - UI
    @IBOutlet weak var textField: UITextField!
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = text
    }
    // MARK: - Action
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        if let text = textField.text {
        delegate?.dataSend(data: text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
