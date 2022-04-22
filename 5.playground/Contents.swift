import UIKit


// Task 1
var value = 10
let target = 2

let operations : [(Int, Int) -> Int] = [(+), (*), (-), (/), (+)]
for operation in operations {
    value = operation(value, target)
}

print("\(value)\n")


// Task 2
var list: [Int] = [1, 5, 6, 7, 9, 54, 87, 67, 5, 45, 8]
for item in list {
    let toString : (Int) -> String = {return "\($0)"}
    print(toString(item))
}


// Task 3
func fibonacci(_ n : Int) -> Int {
    return n <= 1 ? n : fibonacci(n-1) + fibonacci(n-2)
}

let n = 10
print("\nfib(\(n)) = \(fibonacci(n))")
