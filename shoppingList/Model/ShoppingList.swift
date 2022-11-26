import Foundation
import UIKit

struct ShoppingList {
    var name: String?
    var list: [String] = []
    
    static var shoppingList: [ShoppingList] = [
        ShoppingList(name: "쇼핑리스트", list: ["A", "B", "C"]), ShoppingList(name: "사야되는 과일 목록", list: ["1", "2", "3"])
    ]
}


