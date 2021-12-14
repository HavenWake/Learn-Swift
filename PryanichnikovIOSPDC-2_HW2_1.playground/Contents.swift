import UIKit
//Задача 1
/*
 1.Переменную с возрастом лучше сделать типа Integer. Этот тип лучше всего подходит в абсолютном большинстве случаев.
 2.Переменную с населением города лучше сделать типа Integer. Население может изменится, но оно всегда будет оставаться целочисленным.
 3.Переменную с числом звезд в галактике лучше сделать типа Integer. Число звезд точно неизвестно, каждый раз появляются новые сведения, но оно точно всегда остается целочисленным
 4.Переменную с байтом ОЗУ лучше сделать типа double или float. Возможно потреюуется указать байт озу в других единицах измерения, например в килобитах, тогда потребуются числа с плавающей точкой
 5.Переменную со средней зарплатой лучше сделать типа double или float. Средний заработок далеко не всегда будет целочисленным.
 6.Переменную с цветом фигуры лучше сделать типа String. Строковая переменная позволяется принять названия любых цветов в том числе можно указать цвет кодом, например HEX
 7.Переменную с длинной в сантиметрах лучше сделать типа double. Часто длинна указываемая в сантиметрах может быть не целочисленной.
 8.Переменную с длинной в миллиметрах лучше сделать типа integer. В редких случая может понадобиться использоваться Double, но чаще всего исползуется целочисленная переменная при указании длинн в миллиметрах
 9.Переменную с фамилией лучше сделать типа String. Фамилию невозможно записать числом или уместить в 1 символ, строка подходит лучше всего.
 10.Переменную со временем года лучше сделать типа String. Время года не получится записать числом или булевым значением,также не уместить в 1 символ.
 11.Переменную с полом лучше сделать типа String. В некоторых случая может хватить char, например в РФ в графе выбора пола можно выбрать "М" или "Ж", но все же в большинстве случаев лучше подойдет String
 */

//Задача 2
let age: Int = 25
print(age)
var population: Int = 12308240
print(population)
var starsInGalaxy: Int = 2_050_607_050
print(starsInGalaxy)
let biteInRam: Double = 0.108454
print(biteInRam)
let averageSalaryPerYear: Double = 140000.235
print(averageSalaryPerYear)
let colorFigure: String = "red"
print(colorFigure)
var lengthInCentimeters: Double = 13.3
print(lengthInCentimeters)
var lengthInMillimeters: Int = 200
print(lengthInMillimeters)
let secondName: String = "Pryanichnikov"
print(secondName)
var season: String = "Winter"
print(season)
let gender: String = "Male"
print(gender)


//Задача 3

var salaryWorkerOne = 55000
var salaryWorkerTwo = 40000
var salaryWorkerThree = 70000

salaryWorkerOne *= 2
salaryWorkerTwo += 15000
salaryWorkerThree *= 1

print(salaryWorkerOne, "\n", salaryWorkerTwo, "\n", salaryWorkerThree)

