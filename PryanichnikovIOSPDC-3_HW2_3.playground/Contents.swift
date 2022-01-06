import UIKit

//Задача 1
let vkData = "19067"
let fbData = "13400"
let instData = "_10045"
let youTubeData = "10$0d00"
let webSiteData = "I0I12"
var sumRetrievingValue = 0

//nil-coalescing способ
sumRetrievingValue += Int(vkData) ?? 0
sumRetrievingValue += Int(fbData) ?? 0
sumRetrievingValue += Int(instData) ?? 0
sumRetrievingValue += Int(youTubeData) ?? 0
sumRetrievingValue += Int(webSiteData) ?? 0

print("Сумма удачно извлеченных значений с помощью nil-coalescing: \(sumRetrievingValue)")

//optional binding способ
sumRetrievingValue = 0 // Обнуление значения с прошлого подсчета, что бы не инициализировать новую переменную

if let checkValue = Int(vkData) {
    sumRetrievingValue += checkValue
}

if let checkValue = Int(fbData) {
    sumRetrievingValue += checkValue
}

if let checkValue = Int(instData) {
    sumRetrievingValue += checkValue
}

if let checkValue = Int(youTubeData) {
    sumRetrievingValue += checkValue
}

if let checkValue = Int(webSiteData) {
    sumRetrievingValue += checkValue
}

print("Сумма удачно извлеченных значений с помощью optional binding: \(sumRetrievingValue)")

//forced unwrapping
sumRetrievingValue = 0 // Обнуление значения с прошлого подсчета, что бы не инициализировать новую переменную

if Int(vkData) != nil{
    sumRetrievingValue += Int(vkData)!
}
if Int(fbData) != nil{
    sumRetrievingValue += Int(fbData)!
}
if Int(instData) != nil{
    sumRetrievingValue += Int(instData)!
}
if Int(youTubeData) != nil{
    sumRetrievingValue += Int(youTubeData)!
}
if Int(webSiteData) != nil{
    sumRetrievingValue += Int(webSiteData)!
}

print("Сумма удачно извлеченных значений с помощью forced unwrapping: \(sumRetrievingValue)")

//Задача 2
var isConfirm = true

if let payment = Int(vkData){
    if isConfirm == true{
        print("Ты подтвердил оплату на сумму: \(payment)")
    }
    else if isConfirm == false{
        print("Платеж отменен")
    }
}
else{
    print("Упс… Нам жаль, что-то пошло не так, попробуйте позже")
}

//Задача 3
var sumValueInArray = 0
let servicesData = ["19067", "13400", "_10045", "10$0d00", "I0I12"]

for data in servicesData{
    if let valueCheck = Int(data){
        sumValueInArray += valueCheck
    }
}

print("Сумма удачно извлеченных значений из массива: \(sumValueInArray)")
