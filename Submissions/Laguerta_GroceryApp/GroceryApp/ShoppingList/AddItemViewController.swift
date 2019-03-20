import UIKit

class AddItemViewController: UIViewController {
    var model: ShoppingListModel?

    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.isEnabled = false

        quantityTextField.delegate = self
        nameTextField.delegate = self
    }

    @IBAction func userTappedButton(_ sender: UIButton) {
        guard let name = nameTextField.text, let quantity = Int(quantityTextField.text ?? "") else {
            return
        }

        let groceryItem = model?.addItemToShoppingList(name: name, quantity: quantity)
        print(groceryItem ?? "")
    }
}

extension AddItemViewController: UITextFieldDelegate {

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let name = try? model?.validate(name: nameTextField.text)
        let quantity = try? model?.validate(quantity: quantityTextField.text)

        if name != nil, quantity != nil {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }

        return true
    }
}