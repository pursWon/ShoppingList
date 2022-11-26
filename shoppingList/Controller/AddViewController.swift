import UIKit
/*
 - 어느 섹션에 추가할지에 대한 정보가 필요하다.
 - 추가하고자 하는 항목의 이름(String)이 필요
 */


class AddViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var itemNameTextField: UITextField!
    
    var newList: ShoppingList?
    
    override func viewDidLoad() {
    super.viewDidLoad()

    }
    //MARK: - Action 
    @IBAction func saveButton(_ sender: UIButton) {
        let listName = listNameTextField.text!
        let itemName = itemNameTextField.text!
        
        if !listName.isEmpty && !itemName.isEmpty {
        // 기존의 해당 listname의 section를 가져오기 (shoppingList 타입)
        // 그 shoppingList의 list에 itemName을 추가
        
        // 만약 기존 shoppingList에 listName이 없으면
        // 이미 작성한대로 새로 추가
        newList = ShoppingList(name: listName, list: [itemName]) // 새로운 리스트가 생긴다. 이걸 기존 리스트에 추가되도록 수정
            
            if let newList = newList {
            ShoppingList.shoppingList.append(newList)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}
