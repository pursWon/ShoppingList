import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopping.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCell else { return UITableViewCell() }
        
        let shopping = shopping[indexPath.row]
        cell.titleLabel.text = shopping.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "listClick", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listClick" {
            if let vc = segue.destination as? SelectedViewController {
                if let index = sender as? Int {
                    vc.data = shopping[index].name!
                }
            }
        }
    }
    
    @IBAction func listAddButton(_ sender: UIButton) {
        performSegue(withIdentifier: "listAdd", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

class ShoppingCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

class contentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contentsTableView: UITableView!
    @IBOutlet weak var titleTextField: UITextField!
    var data: String = ""
    var unChecked: Bool = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentsTableView.dequeueReusableCell(withIdentifier: "ContentsCell", for: indexPath) as? ContentsCell else { return UITableViewCell() }
        
        return cell
    }
    
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
            sender.setImage(UIImage(), for: .normal)
            unChecked = true
        }
    }
    
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = contentsTableView.cellForRow(at: indexPath) as! ContentsCell
        cell.tag += 1
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let text = titleTextField.text!
        let newText: ShoppingList = ShoppingList(name: text)
        shopping.append(newText)
        dismiss(animated: true)
    }
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class ContentsCell: UITableViewCell {
    @IBOutlet weak var contentsTextField: UITextField!
}

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCell", for: indexPath) as? SelectedCell else { return UITableViewCell() }
        cell.contentsTextField.text = memo[indexPath.row].content
        
        return cell
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let text: String = titleTextField.text!
        let existingText: ShoppingList = ShoppingList(name: text)
        shopping.insert(existingText, at: 0)
        // 수정했던 셀의 위치 그대로 저장..
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
}

class SelectedCell: UITableViewCell {
    @IBOutlet weak var contentsTextField: UITextField!
}
