import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Sampleprotocol {
    
    let defaults = UserDefaults.standard

    // MARK: - UI
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func dataSend(data: String) {
        UserDefaults.standard.setValue(data, forKey: "modifiedText")
        self.tableView.reloadData()
    }
    // MARK: - Actions
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
    }
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ShoppingList.shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ShoppingList.shoppingList[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingList.shoppingList[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCell else { return UITableViewCell() }
        
        let item = ShoppingList.shoppingList[indexPath.section].list[indexPath.row]
        // shoppingList 배열을 각 indexPath.section에 두고 section의 row(행)에 list의 내용을 둔다.
        
        let data = UserDefaults.standard.integer(forKey: "modifiedText")
        cell.titleLabel.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentCell = tableView.cellForRow(at: indexPath)! as? ShoppingCell
        let text = currentCell?.titleLabel.text!
        guard let selectedVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectedViewController") as? SelectedViewController
        else { return }
        
        selectedVC.text = text!
        selectedVC.delegate = self
        
        self.navigationController?.pushViewController(selectedVC, animated: true)
    }
}


