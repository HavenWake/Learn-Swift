import UIKit
import Foundation
//Задача 1

var a: Int? = 45
var b: Int? = 35
var c: Int? = nil

a = a ?? 10
b = b ?? 23
c = c ?? 34
print(a, "\n", b, "\n", c)
c ?? 109
print(c)



let one = "100"
let two = "200"
let three = "300"
let four = "13413h"
let five = "sdf345"
var sum = 0

if let one = Int(one){
    sum = sum + one
}

if let two = Int(two){
    sum = sum + two
}

if let three = Int(three){
    sum = sum + three
}

if let four = Int(four){
    sum = sum + four
}

if let five = Int(five){
    sum = sum + five
}
print("Сумма: \(sum)" )

/*if let oneS = Int(one), let twoS = Int(two), let threeS = Int(three), let fourS = Int(four), let fiveS = Int(five){
    let sum = oneS + twoS + threeS + fiveS + fourS
    print(sum)
}*/


//Задача 2

let temperature: Int?
temperature = Int("+11")

if temperature == nil{
    print("Температура неопределена, возможно термометр неисправен")
}
else if let temperature = temperature, temperature > 0, temperature <= 10 {
 print("Температура выше нуля, текущая температура за окном \(temperature)")
}
else if let temperature = temperature, temperature < 0, temperature >= -10 {
    print("Температура ниже нуля, текущая температура за окном \(temperature)")
   }
else if let temperature = temperature, temperature < -10 {
    print("Температура ниже -10 градусов, текущая температура за окном \(temperature)")
   }
else if let temperature = temperature, temperature > 10 {
    print("Температура выше 10 градусов, текущая температура за окном \(temperature)")
   }

 
