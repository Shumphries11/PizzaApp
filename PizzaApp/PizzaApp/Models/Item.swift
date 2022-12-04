import Foundation

struct Item: Hashable {
    let id = UUID()
    let menuItem: String
    let price: String
    let image: String
    
    init(menuItem: String = "", price: String = "", image: String = "") {
        self.menuItem = menuItem
        self.price = price
        self.image = image
    }
}
