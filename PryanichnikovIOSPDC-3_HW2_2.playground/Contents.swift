import UIKit
//Задача 1
let salaryWorkerOne = 110000
let salaryWorkerTwo = 55000
let salaryWorkerThree = 70000

let matchOne = salaryWorkerOne > salaryWorkerThree
print(matchOne)
let matchTwo = salaryWorkerTwo < salaryWorkerOne
print(matchTwo)
let matchThree = salaryWorkerOne > salaryWorkerTwo || salaryWorkerThree < salaryWorkerTwo
print(matchThree)
let matchFour = salaryWorkerThree < salaryWorkerOne && salaryWorkerTwo > salaryWorkerOne
print(matchFour)

//Задача 2

let a = 0
let b = 0
let c = 0

let d = b * b - 4 * a * c

//Через if-else
if d > 0 {
    print("График скорее всего продолжит направление")
}
else if d < 0 {
    print("График скорее всего поменяет направление")
}
else {
    print("Неопределенная ситуация - нужно ждать")
}

//Через ?
d > 0 ? print("График скорее всего продолжит направление") :  d == 0 ? print("Неопределенная ситуация - нужно ждать") : print("График скорее всего поменяет направление")

//Через Switch
switch d {
case 1...:
    print("График скорее всего продолжит направление")
case ..<0:
    print("График скорее всего поменяет направление")
default:
    print("Неопределенная ситуация - нужно ждать")
}


//Задача 3
var yearsOld = 25
let gender = "male"

if yearsOld >= 3 && yearsOld < 17
{
    gender == "male" ? print("Детский контент для мальчиков") : gender == "female" ? print("Детский контент для девочек") : print("Нет подходящего контента")
}
else if yearsOld >= 18 && yearsOld <= 65{
    gender == "male" ? print("Взрослый контент для мужчин") : gender == "female" ? print("Взрослый контент для женщин") : print("Нет подходящего контента")
}
else if yearsOld > 65 {
    gender == "male" ? print("Контент для мужчин пожилого возраста") : gender == "female" ? print("Контент для женщин пожилого возраста") : print("Нет подходящего контента")
}
else{
    print("Нет подходящего контента")
}
