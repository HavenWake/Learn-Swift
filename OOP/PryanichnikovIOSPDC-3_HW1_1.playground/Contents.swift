import UIKit

//Задача 1.
//
//Абстракция
//Процессор: Повышение частоты, решение задачи, понижение частоты
//Оперативная память: загрузка в память, выполнение операций, высвобождение из памяти
//Вентилятор: увеличение кол-ва оборотов, уменьшение кол-ва оборотов

protocol Processor {
    func upFrequency()
    func problemSolving()
    func downFrequency()
}

protocol Ram {
    func downloadMemory()
    func operations()
    func unloadingMemory()
}

protocol Cooler {
    func speedIncrease()
    func speedReduction()
}

//Инкапсуляция
//Включение компьютера (включение в розетку, нажатие на кнопку power)
//Открытие браузера ()
//Залогин на сайте (ввод логина и пароля)

func powerOnPc(isPowerButton: Bool, isPowerSocket: Bool) -> Bool {
    return true
}

func openBrowser() {

}

func login(login: String, password: String) -> Bool {
    return true
}

//Наследование
//Родитель - Компьютер (Оперативная память, процессор, накопитель)
//Наследник - Компьютер HP (Оперативная память : HyperX 16ГБ, Процессор: Intel Core i3, Накопитель: SSD 240GB)
//Родитель - Смартфон (Операционная система, аккумулятор, экран)
//Наследник Iphone (Операционная система: iOS, аккумулятор, экран: Retina, камера)
//Родитель - Часы (Отображение времени)
//Наследник - Apple watch (Отображение времени, совершение звонка, отображение уведомлений)
class Pc {
    var ram: String
    var processor: String
    var storage: String

    init(ram: String, processor: String, storage: String){
        self.ram = "Crucial 8GB"
        self.processor = "Pentium G4600 3.7 Ghz"
        self.storage = "HDD WD Blue 1TB"
    }
}

class ComputerHp: Pc {
    override init(ram: String, processor: String, storage: String) {
        super.init(ram: "HyperX 16 GB", processor: "Intel Core i3", storage: "SSD 240GB")
    }
}


class SmartPhone {
    var operationSystem: String
    var screen: String

    init(os: String, screen: String) {
        self.operationSystem = ""
        self.screen = ""

    }
}

class Iphone: SmartPhone {
    init(camera: Bool) {
        super.init(os: "iOS", screen: "Retina")
    }
}

class Watch {
    func timeDysplay() {

    }
}

class AppleWatch: Watch {
    func call() {

    }
    func notification() {

    }
}

//Полиморфизм
//Телевизор, роутер, монитор - объекты
//Включение - поведение
//Клавиатура, мышка - объекты
//Нажатие на клавишу - поведение
//Окно, дверь - обекты
//Открытие и закрытие - поведение
protocol PowerOn {
    func powerOn()
}

class iphone: PowerOn {
    func powerOn() {

    }
}

class HpOmenPc: PowerOn {
    func powerOn() {

    }
}

class AppleWatchFive: PowerOn {
    func powerOn() {

    }
}

protocol ClickOnButton {
    func pressButton()
}

class Keybord: ClickOnButton {
    func pressButton() {

    }
}

class Mouse: ClickOnButton {
    func pressButton() {

    }
}

protocol OpenAndClose {
    func open()
    func close()
}

class Window: OpenAndClose {
    func open() {

    }
    func close() {

    }
}

class Door: OpenAndClose {
    func open() {

    }
    func close() {

    }
}



//Задача 2.
//Класс - Телефон, Компьютер, Часы
//Методы - Телефон (Совершение взонка, отправка сообщения), Компьютер (Запуск браузера, Запуск игры), Часы (Установить таймер, показать время)
class Phone {
    var os = ""
    var ram = ""
    var storage = ""

    func call() {

    }
    func sendMessage() {

    }

}

class Computer {
    var processor = ""
    var ram = ""

    func powerOnPC() {

    }
    func startGame() {

    }
}

class WatchNew {
    var osVersion = ""
    var storage = ""

    func setTimer() {

    }

    func showTime() {

    }

}

//Объект - IphoneXs, HP Omen PC, Apple Watch
var iphoneXs: Phone = Phone()
var hpOmenPC: Computer = Computer()
var appleWatch: WatchNew = WatchNew()

//Свойства объектов -
//Iphone (Операционная система, объем ОЗУ, объем накопителя)
iphoneXs.storage = "64GB"
iphoneXs.ram = "4GB"
iphoneXs.os = "iOS"
//HP Omen PC (Процессор, оперативная память)
hpOmenPC.ram = "16GB"
hpOmenPC.processor = "intel Core i7"
//Apple Watch (Версия операционной системы, объем накопителя)
appleWatch.storage = "32 GB"
appleWatch.osVersion = "WatchOS 8.4.2"
