import UIKit
import Darwin
import Foundation
//Задача 1
let january = "Январь"
let february = "Февраль"
let march = "Март"
let april = "Апрель"
let may = "Май"
let june = "Июнь"
let july = "Июль"
let august = "Август"
let september = "Сентябрь"
let october = "Октябрь"
let november = "Ноябрь"
let december = "Декабрь"
var selectedMonth: String

selectedMonth = may

if selectedMonth == "Январь" {
    print("Текущий месяц Январь, кол-во рабочих дней: \(31 - (8+8))")
}
else if selectedMonth == "Февраль" {
    print("Текущий месяц Февраль, кол-во рабочих дней: \(28 - (8+1))")
}
else if selectedMonth == "Март" {
    print("Текущий месяц Март, кол-во рабочих дней: \(31 - (8+1))")
}
else if selectedMonth == "Апрель" {
    print("Текущий месяц Апрель, кол-во рабочих дней: \(30 - (8))")
}
else if selectedMonth == "Май" {
    print("Текущий месяц Май, кол-во рабочих дней: \(31 - (8+1))")
}
else if selectedMonth == "Июнь" {
    print("Текущий месяц Июнь, кол-во рабочих дней: \(30 - (8+1))")
}
else if selectedMonth == "Июль" {
    print("Текущий месяц Июль, кол-во рабочих дней: \(31 - (8))")
}
else if selectedMonth == "Август" {
    print("Текущий месяц Август, кол-во рабочих дней: \(31 - (8))")
}
else if selectedMonth == "Сентябрь" {
    print("Текущий месяц Сентябрь, кол-во рабочих дней: \(30 - (8))")
}
else if selectedMonth == "Октябрь" {
    print("Текущий месяц Октябрь, кол-во рабочих дней: \(31 - (8))")
}
else if selectedMonth == "Ноябрь" {
    print("Текущий месяц Ноябрь, кол-во рабочих дней: \(30 - (8+1))")
}
else if selectedMonth == "Декабрь" {
    print("Текущий месяц Декабрь, кол-во рабочих дней: \(31 - (8))")
}

//Задача 2
switch selectedMonth {
case "Январь":
    print("Текущий месяц Январь, кол-во рабочих дней: \(31 - (8+8))")
case "Февраль":
    print("Текущий месяц Февраль, кол-во рабочих дней: \(28 - (8+1))")
case "Март":
    print("Текущий месяц Март, кол-во рабочих дней: \(31 - (8+1))")
case "Апрель":
    print("Текущий месяц Апрель, кол-во рабочих дней: \(30 - (8))")
case "Май":
    print("Текущий месяц Май, кол-во рабочих дней: \(31 - (8+1))")
case "Июнь":
    print("Текущий месяц Июнь, кол-во рабочих дней: \(30 - (8+1))")
case "Июль":
    print("Текущий месяц Июль, кол-во рабочих дней: \(31 - (8))")
case "Август":
    print("Текущий месяц Август, кол-во рабочих дней: \(31 - (8))")
case "Сентябрь":
    print("Текущий месяц Сентябрь, кол-во рабочих дней: \(30 - (8))")
case "Октябрь":
    print("Текущий месяц Октябрь, кол-во рабочих дней: \(31 - (8))")
case "Ноябрь":
    print("Текущий месяц Ноябрь, кол-во рабочих дней: \(30 - (8+1))")
case "Декабрь":
    print("Текущий месяц Декабрь, кол-во рабочих дней: \(31 - (8))")
default:
    print("Ошибка, месяц не определен")
}

//Задача 3
var isHoliday = false

isHoliday == true ? print ("Сегодня выходной день") : print ("Сегодня рабочий день")

//Задача 4
enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december

    var description: String {
        switch self {
        case .january: return "Январь"
        case .february: return "Февраль"
        case .march: return "Март"
        case .april: return "Апрель"
        case .may: return "Май"
        case .june: return "Июнь"
        case .july: return "Июль"
        case .august: return "Август"
        case .september: return "Сентябрь"
        case .october: return "Октябрь"
        case .november: return "Ноябрь"
        case .december: return "Декабрь"
        }
    }
}

print(Month.december.description)



