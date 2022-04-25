import UIKit

// Task 1
var list = [3, 4, nil, 5, 7, nil, 8, 5, 3, 3, nil, 2, 2, 2, 5]

let noNils: [Int] = list.compactMap({$0})
print("\(noNils) \n")

// Task 2
let noDuplicates : [Int] = noNils.reduce([Int](), {list, element in
    list.contains(element) ? list : list + [element]
})
print("\(noDuplicates) \n")

// Task 3
let uniqueElements : Int = noDuplicates.count
print("\(uniqueElements) \n")

// Task 4
func flattenArray<T>(_ array : [T], _ result : inout [T]) {
    array.forEach { element in
        if let element = element as? [T] {
            flattenArray(element, &result)
        } else {
            result.append(element)
        }
    }
}

var array : [Any] = [3, [4, 5], [7, [8, 5]], [3, [3, [2, [2], 2], 5]]]
var result = [] as [Any]

flattenArray(array, &result)
print(result)


