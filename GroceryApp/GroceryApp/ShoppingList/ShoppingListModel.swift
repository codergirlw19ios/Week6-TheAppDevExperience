import Foundation

protocol ShoppingListModelDelegate: class {
    func dataUpdated()
}

class ShoppingListModel {
    // MARK: - initialization
    init(stateController: StateController){
        self.stateController = stateController
    }

    deinit {
        print("deinit ShoppingListModel")
    }

    // MARK: - private variables
    private let stateController: StateController
    private var shoppingList: [GroceryItem] { return stateController.shoppingList }

    // MARK: - public variables
    weak var delegate: ShoppingListModelDelegate?
    var listCount: Int { return shoppingList.count }

    func groceryItemFor(row: Int) -> GroceryItem? {
        guard row < listCount else { return nil }
        return shoppingList[row]
    }

    // MARK: - functions 
    func addItemToShoppingList(name: String, quantity: Int) -> GroceryItem {
        let groceryItem = GroceryItem(name: name, quantity: quantity)

        stateController.shoppingList.append(groceryItem)

        // let the controller know to update the table view
        delegate?.dataUpdated()

        return groceryItem
    }

    func validate(name: String?) throws -> String {
        return try Validation.notEmpty(name)
    }

    func validate(quantity: String?) throws -> Int {
        return try Validation.validInt(quantity)
    }
}
