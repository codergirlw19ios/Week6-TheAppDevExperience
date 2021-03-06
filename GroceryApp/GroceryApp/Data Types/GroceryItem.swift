import Foundation

struct GroceryItem: Hashable, Codable {
    let name: String
    var quantity: Int
    var cost: Double?

    init(name: String, quantity: Int, cost: Double? = nil) {
        self.name = name
        self.quantity = quantity
        self.cost = cost
    }

    mutating func update(cost: Double){
        self.cost = cost
    }

    mutating func update(quantity: Int){
        self.quantity = quantity
    }
}
