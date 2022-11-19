import Foundation
import UIKit

class SelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var selectedTableView: UITableView!
    @IBOutlet weak var titleTextField: UITextField!
    var data: String = ""
    var unChecked: Bool = true
    
    override func viewDidLoad() {
        selectedTableView.dataSource = self
        selectedTableView.delegate = self
        titleTextField.text = data
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let text: String = titleTextField.text!
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "tableViewController") as? TableViewController
        else { return }
        
        vc.data = titleTextField.text!
        self.navigationController?.pushViewController(vc, animated: true)
        
        dismiss(animated: true)
    }
    
    
    @IBAction func checkButton(_ sender: UIButton) {
        if unChecked == true {
            sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
            unChecked = false
        } else if unChecked == false {
            sender.setImage(UIImage(), for: .normal)
            unChecked = true
        }
    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCell", for: indexPath) as? SelectedCell else { return UITableViewCell() }
        cell.contentsTextField.text = memo[indexPath.row].content
        
        return cell
    }
    
}

class SelectedCell: UITableViewCell {
    @IBOutlet weak var contentsTextField: UITextField!
}

