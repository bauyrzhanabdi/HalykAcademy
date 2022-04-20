import UIKit

// Task 1
//let array: [Any?] = [0, nil, "String", 4.5, Optional(true)]
//
//var result : [Any] = []
//for item in array where item != nil {
//    result.append(item!)
//}
//
//print(result)


//Task 2
//let array: [Any] = ["Tom", "Jerry", 1, 2, 3, 4, 2.4, 6.5, "Garfield", true, false, false, 40.3]
//
//for i in 0 ..< array.count {
//    print(type(of: array[i]))
//}


// Task 3
//enum Weekday : CaseIterable {
//    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
//}
//
//let date = 12
//let day: Weekday = .Tuesday
//let numberOfDaysInWeek = 7
//var dict : [Int : Weekday] = [date % numberOfDaysInWeek : day]
//var range = (date - 1) ..< (date + 6)
//
//for (dateNumber, dayType) in zip(range, Weekday.allCases) {
//    dict[dateNumber % numberOfDaysInWeek] = dayType
//}
//
//let certainDay = 24
//let firstDay = 1
//var lastFriday = (dict.first(where: {_, value in value == .Friday}))!.key
//
//while lastFriday <= 30 {lastFriday += numberOfDaysInWeek}
//lastFriday -= numberOfDaysInWeek
//
//print("День недели 24 числа: \(dict[certainDay % numberOfDaysInWeek]!)")
//print("Месяц начался с: \(dict[firstDay % numberOfDaysInWeek]!)")
//print("Число последней пятницы: \(lastFriday)")










