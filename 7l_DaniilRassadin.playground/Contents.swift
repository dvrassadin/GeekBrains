import UIKit

//склад стройматериалов

enum StockErrors: String, Error {
    case noSuchItem = "Такого предмета нет"
    case notEnoughItems = "Недостаточно предметов"
    case notEnoughCapacity = "Недостаточно места в погрузчике"
}

struct Item {
    var itemName: String
    var itemAmount: Int
}

class Stock {
    var stockItems = [
        "доски": Item(itemName: "доски", itemAmount: 500),
        "кирпичи": Item(itemName: "кирпичи", itemAmount: 230),
        "фанера": Item(itemName: "фанера", itemAmount: 350)
    ]
    
    let maxLoaderCapacity = 200
    
    func takeItems(itemName: String, itemAmount: Int) throws {
        
        guard let newItem = stockItems[itemName] else {
            throw StockErrors.noSuchItem
        }
        guard itemAmount < newItem.itemAmount else {
            throw StockErrors.notEnoughItems
        }
        guard itemAmount < maxLoaderCapacity else {
            throw StockErrors.notEnoughCapacity
        }
        var newItem2 = newItem
        newItem2.itemAmount -= itemAmount
        stockItems[itemName] = newItem2
        print("Получено: \(newItem.itemName), \(itemAmount) шт., осталось \(newItem2.itemAmount) шт.")
    }
}

let stock1 = Stock()

do {
    try stock1.takeItems(itemName: "доски", itemAmount: 190)
} catch StockErrors.noSuchItem {
    print(StockErrors.noSuchItem.rawValue)
} catch StockErrors.notEnoughItems {
    print(StockErrors.notEnoughItems.rawValue)
} catch StockErrors.notEnoughCapacity {
    print(StockErrors.notEnoughCapacity.rawValue)
}
