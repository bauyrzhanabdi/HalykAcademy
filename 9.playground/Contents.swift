import UIKit

// Task 1
protocol Operation {
    func doOperation(_ value : Int, _ target : Int) -> Int
}

class Addition: Operation {
    func doOperation(_ value : Int, _ target : Int) -> Int {
        return value + target
    }
}

class Substraction: Operation {
    func doOperation(_ value : Int, _ target : Int) -> Int {
        return value - target
    }
}

class Multiplication: Operation {
    func doOperation(_ value : Int, _ target : Int) -> Int {
        return value * target
    }
}

class Division: Operation {
    func doOperation(_ value : Int, _ target : Int) -> Int {
        return value / target
    }
}

var value = 10
let target = 2
let operations : [Operation] = [Addition(), Substraction(), Multiplication(), Division(), Division()]

operations.forEach({
    value = $0.doOperation(value, target)
})

print("\(value)\n")

// Task 2
enum Auth {
    case login
    case google
    case facebook
}

protocol AuthorizationProtocol  {
    func authorization(_ authCase : Auth) -> String
}

class Authorization : AuthorizationProtocol {
    func authorization(_ authType : Auth) -> String {
        return "\(authType)"
    }
}

var signUp = Authorization()
let authType : Auth = .login

switch authType {
case .login : print("Authorization via \(signUp.authorization(authType))\n")
case .facebook : print("Authorization via \(signUp.authorization(authType))\n")
case .google : print("Authorization via \(signUp.authorization(authType))\n")
}

// Task 3

class CashRegister {
    private var cash : Int

    init(_ cash : Int) {
        self.cash = cash
    }

    func setCash(_ price : Int, _ operation : ((Int,Int) -> Int) ) -> Bool {
        cash = operation(cash, price)
        return true
    }

    func getCash() -> Int {
        return cash
    }
}

class Shop {
    private let kassa = CashRegister(5000)
    
    func buyProduct(_ item : String, _ price : Int) {
        if kassa.getCash() >= price {
            kassa.setCash(price, (-))
            print("Shop purchased a \(item)")
        } else {
            print("Shop failed to purchase a \(item)")
        }
    }
    
    func sellProduct(_ item : String, _ price : Int) {
        if kassa.setCash(price, (+)) {
            print("Shop sold a \(item)")
        } else {
            print("Shop did not sell a \(item)")
        }
    }
}

var shop = Shop()
var products : [String : Int] = ["ice cream" : 1000, "bread" : 500, "bicycle" : 3600]

products.keys.forEach({ item in
    if let price = products[item] {
        shop.buyProduct(item, price)
    }
})










