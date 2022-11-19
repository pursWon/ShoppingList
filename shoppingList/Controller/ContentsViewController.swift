import Foundation
import UIKit

class ContentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentsTableView: UITableView!
    @IBOutlet weak var titleTextField: UITextField!
    var data: String = ""
    var unChecked: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.placeholder = "제목을 입력하세요"
        contentsTableView.delegate = self
        contentsTableView.dataSource = self
        titleTextField.text = data
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        if unChecked == true {
            sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
            unChecked = false
        } else if unChecked == false {
            sender.setImage(.none, for: .normal)
            unChecked = true
        }
    }
    
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let text = titleTextField.text
        let newText: ShoppingList = ShoppingList(name: text ?? "")
        shopping.append(newText)
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentsTableView.dequeueReusableCell(withIdentifier: "ContentsCell", for: indexPath) as? ContentsCell else { return UITableViewCell() }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class ContentsCell: UITableViewCell {
    @IBOutlet weak var contentsTextField: UITextField!
}
