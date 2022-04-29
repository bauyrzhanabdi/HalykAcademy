import UIKit

protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
}

protocol Shop {
    /// Добавить товар в магазин, если его нет.
    /// Возвращает успешное добавление.
    func add(_ product: Product)-> Bool

    /// Удалить товар по ID из магазина, если он есть.
    /// Возвращает успешное удаление.
    func delete(productBy id: Int) -> Bool

    /// Вывести все продукты в магазине
    func productList() ->[Product]
    
    /// Искать все товары по имени и возвращать их
    func productList(productBy name : String) -> [Product]
    
    /// Возвращает 10 первых товаров из всех отсортированных товаров по имени
    func firstTenProducts() -> [Product]
}

protocol Services {
    /// Генерировать случайных 50 товаров и добавлять их в наш магазин. (id - должны быть разными)
    func randomProducts() -> Bool

    /// Найти все товары по названию и удалить их.
    func delete(productBy name: String) -> Bool
    
    /// Очистить магазин
    func clear() -> Bool
}

struct Item : Product {
    var id: Int
    var name: String
    var manufacturer: String
    
    init(_ id: Int, _ name: String, _ manufacturer: String) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
    }
}

class Store : Shop, Services {
    var items : [Product]

    init(_ items: [Product]) {
        self.items = items
    }

    func add(_ product: Product) -> Bool {
        if items.contains(where: {item in item.id == product.id}) {
            return false
        }
        
        items.append(product)
        return true
    }

    func delete(productBy id: Int) -> Bool {
        if items.contains(where: {item in item.id == id}) {
            items = items.filter({item in item.id != id})
            return true
        }
        
        return false
    }

    func productList() -> [Product] {
        return items
    }
    
    func productList(productBy name: String) -> [Product] {
        return items.filter({item in item.name == name})
    }
    
    func firstTenProducts() -> [Product] {
        let sorted : [Product] = items.sorted(by: {item1, item2 in item1.name < item2.name})
        if sorted.count < 10 {return sorted}
        
        var result : [Product] = []
        for i in 0 ..< 10 {
            result.append(sorted[i])
        }
        
        return result
    }
    
    func randomProducts() -> Bool {
        let names : [String] = ["IPhone 11", "Samsung S12", "IPhone XR", "Sony Xperia Z", "Poco M1", "Xiaomi Note Pro", "IPhone 6", "Oppo A11s", "One Plus 3T"]
        let manufacturers : [String] = ["KZ", "RU", "CN", "US", "MX", "GB", "UZ", "KR", "JP"]
        let totalElements = 50
        var generatedElements = 0
        
        
        while generatedElements != totalElements {
            let randomProduct : Product = Item(Int.random(in: 0...100), names.randomElement()!, manufacturers.randomElement()!)
            
            if items.contains(where: {item in item.id == randomProduct.id}) {
                continue
            }
            
            items.append(randomProduct)
            generatedElements += 1
            
        }
        
        return generatedElements == totalElements ? true : false
    }
    
    func delete(productBy name: String) -> Bool {
        if items.contains(where: {item in item.name == name}) {
            items = items.filter({item in item.name != name})
            return true
        }
        
        return false
    }
    
    func clear() -> Bool {
        items.removeAll()
        return items.count == 0 ? true : false
    }
    
}

var items = [Item(0, "IPhone 11", "KZ"), Item(1, "Samsung A12", "RU"), Item(2, "Sony Xperia T", "CN")]
var store = Store(items)

var item1 = Item(3, "Poco M1", "MX")
var item2 = Item(0, "Poco M4", "SA")
var item3 = Item(4, "IPhone 11", "SA")

store.add(item1)
store.add(item2)
store.add(item3)

store.delete(productBy: 1)
store.delete(productBy: 5)

print(store.productList())
print("\n \(store.productList(productBy: "IPhone 11"))")

print("\n \(store.firstTenProducts())")

store.delete(productBy: "IPhone 11")
print("\n \(store.productList())")


store.clear()
print("\n \(store.productList())")

store.randomProducts()
print("\n \(store.productList())")





