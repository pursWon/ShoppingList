import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell") as? ShoppingCell else { return }
        cell.titleLabel.text = data
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
}

class ShoppingCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}


