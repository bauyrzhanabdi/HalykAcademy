import UIKit

// Task 1
class Shape {
    func area() -> Double {
        return 0
    }
}

class Rectangle : Shape {
    let length : Double
    let width : Double

    init(_ length: Double, _ width: Double) {
        self.length = length
        self.width = width
    }

    override func area() -> Double {
        return length * width
    }
}

class Square : Rectangle {
    init(_ side : Double) {
        super.init(side, side)
    }
}

class Circle : Shape {
    let radius : Double

    init(_ radius: Double) {
        self.radius = radius
    }

    override func area() -> Double {
        return 3.14 * radius * radius
    }
}

var rectangle = Rectangle(5, 10)
var square = Square(6)
var circle = Circle(8)


print(rectangle.area())
print(square.area())
print(circle.area())
print()



// Task 2
enum Status {
    case broken, fixed, ok
}

class Appliance {
    var status: Status

    init(_ status : Status) {
        self.status = status
    }

    func fix() {
        status = status == .broken ? .fixed : .ok
    }
}

class Monitor : Appliance {}
class Phone : Appliance {}
class Camera : Appliance {}

let appliances = [Monitor(.broken), Phone(.broken), Camera(.ok)]
for appliance in appliances {
    print("\(appliance.status) --> ", terminator: "")
    appliance.fix()
    print("\(appliance.status)")
}

print()

// Task 3
class Train {
    let trainWeight : Int
    
    init(_ trainWeight : Int) {
        self.trainWeight = trainWeight
    }
    
    func calculateWeight() -> Int {
        return 0
    }
}

class Passenger : Train {
    let maxPassengers = 30
    let passengerWeight = 60
    let passengers : Int
    
    override init(_ passengers : Int) {
        self.passengers = passengers <= maxPassengers ? passengers : 0
        super.init(2000)
    }
    
    override func calculateWeight() -> Int {
        return passengers * passengerWeight + trainWeight
    }
    
}

class Cargo : Train {
    let cargoWeight : Int
    
    override init(_ cargoWeight : Int) {
        self.cargoWeight = cargoWeight
        super.init(1500)
    }
    
    override func calculateWeight() -> Int {
        return cargoWeight + trainWeight
    }
}

let train = [Passenger(23), Cargo(500), Cargo(600)]
var totalWeight = 0

for carriage in train {
    totalWeight += carriage.calculateWeight()
}

print("Total weight of the train: \(totalWeight)kg")






