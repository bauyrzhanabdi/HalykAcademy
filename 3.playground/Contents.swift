import UIKit

// Task 1
//var isPrime : Bool
//
//for element in 1...100 {
//    isPrime = true
//
//    if element == 1 {
//        continue
//    }
//    else if element == 2 {
//        print(element)
//        continue
//    }
//
//    for n in 2..<element {
//        if element % n == 0 {
//            isPrime = false
//            break
//        }
//    }
//
//    if isPrime {print(element)}
//}


// Task 2
//var array : [Int] = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
//var result : [Int] = []
//
//var i : Int = array.count - 1
//while i >= 0 {
//    result.append(array[i])
//    i -= 1
//}
//print(result)


// Task 3
//var array : [Int] = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
//var originalCount = array.count
//
//array = array.filter({$0 != 0})
//array.append(contentsOf: [Int](repeating: 0, count: originalCount - array.count))
//print(array)


// Task 4
//var array : [Int] = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]
//
//for element in array.sorted(by: {$0 > $1}) {
//    print(element)
//}
       

