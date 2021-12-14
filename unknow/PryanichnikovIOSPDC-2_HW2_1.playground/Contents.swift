import UIKit
import Darwin
// Задача 1
let boysName = ["Sam", "Alex"]
let girlsName = ["Kate","Judith", "Sara"]
var students = girlsName

for (index, _) in students.enumerated() where index == 0{
    students.insert(contentsOf: boysName, at: index)
}
// Задача 2
students.sort()
print(students)

//Задача 3

var arrayOne = [-1, -5, 4, 9]
arrayOne.sort()
arrayOne = arrayOne.filter { element -> Bool in
    element > 0
}
print(arrayOne)

//Задача 4
let numbersArray = [1,2,3,4,7,8,15]

for (number, element) in numbersArray.enumerated(){
    if number > 0 {
        for (numberTwo, elementTwo) in numbersArray.enumerated(){
            if element + elementTwo == 6, element != elementTwo{
                print("Числа в сумме дающие цифру 6 находятся по индексу: \(number) и индексу: \(numberTwo)")
                break
            }
        }
    }
}
