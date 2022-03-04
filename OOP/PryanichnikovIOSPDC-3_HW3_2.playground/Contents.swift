import UIKit
import Foundation
//Протоколы для машины и диллерского центра
protocol CarProtocol {
    var model: String { get }
    var color: String { get }
    var buildDate: Double { get }
    var price: Int { get set }
    var accessories: [String] { get set }
    var isServiced: Bool { get set }
}

protocol DealershipProtocol {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set }
    
    func offerAccessories(Accessories: [String])
    func presaleService(car: Car) -> Bool
    func addToShowroom(car: Car)
    func sellCar(car: Car)
    func orderCar()
}

//Структура для машин
struct Car: CarProtocol {
    var model: String
    var color: String
    var buildDate: Double
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
//Машины
var audiA5 = Car.init(model: "Audi A5", color: "Red", buildDate: 02.2021, price: 3670000, accessories: ["Обивка МКПП кожей", "Сигнализация"], isServiced: false)

var audiA3 = Car.init(model: "Audi A3", color: "Blue", buildDate: 02.2021, price: 3680000, accessories: ["Обивка МКПП кожей"], isServiced: true)

var hondaCrv = Car.init(model: "Honda CR-V", color: "Silver", buildDate: 03.2022, price: 2320000, accessories: [], isServiced: false)

var hondaCivic = Car.init(model: "Honda Civic", color: "Black", buildDate: 07.2022, price: 1320000, accessories: [], isServiced: false)

var volvoV60 = Car.init(model: "Volvo V60", color: "Silver", buildDate: 01.2022, price: 3500000, accessories: ["Сигнализация"], isServiced: true)

var volvoS60 = Car.init(model: "Volvo S60", color: "White", buildDate: 09.2022, price: 4500000, accessories: ["Сигнализация, Литые диски"], isServiced: true)

var bmwX5 = Car.init(model: "BMW X5", color: "White", buildDate: 12.2021, price: 6500000, accessories: ["Рейлинги"], isServiced: false)

var bmwX3 = Car.init(model: "BMW X3", color: "Red", buildDate: 4.2021, price: 5400000, accessories: ["Рейлинги, Зеркала в цвет кузова"], isServiced: false)

var lexusLx = Car.init(model: "Lexus LX", color: "Black", buildDate: 11.2021, price: 8520000, accessories: ["Литые диски"], isServiced: false)

var lexusRx = Car.init(model: "Lexus RX", color: "Sky Blue", buildDate: 5.2021, price: 7320000, accessories: [], isServiced: true)

var lexusLc = Car.init(model: "Lexus LC", color: "Red", buildDate: 6.2021, price: 2450000, accessories: [], isServiced: true)

var lexusLs = Car.init(model: "Lexus LS", color: "Night Blue", buildDate: 8.2021, price: 4320000, accessories: [], isServiced: false)


//Класс для диллерских центров
class Dealership: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    
    func offerAccessories(Accessories: [String]) {
        print("Приобретите дополнительное оборудование")
    }
    func presaleService(car: Car) -> Bool {
        print("Автомобиль отправлен на предпродажную подготовку")
        return true
    }
    func addToShowroom(car: Car) {
        for nameCar in stockCars {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: car)
                self.showroomCars.append(car)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: Car) {
        if presaleService(car: car) {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    showroomCars.remove(at: numberOfCar)
                    print("Проведена предпродажная подготовка, машина \(car.model) продана из салона")
                }
            }
        }
        else {
            print("Предпродажная подготовка не выполнена, машина \(car.model) готова к продаже")
        }
    }
    func orderCar() {
        print("Автомобиль заказан на склад")
    }
}
//Диллерские центры
var bmw = Dealership.init(name: "BMW", showroomCapacity: 12, stockCars: [bmwX5], showroomCars: [bmwX3], cars: [bmwX5,bmwX3])
var audi = Dealership.init(name: "Audi", showroomCapacity: 10, stockCars: [audiA3], showroomCars: [audiA5], cars: [audiA5,audiA3])
var volvo = Dealership.init(name: "Volvo", showroomCapacity: 8, stockCars: [volvoS60], showroomCars: [volvoV60], cars: [volvoV60,volvoS60])
var honda = Dealership.init(name: "Honda", showroomCapacity: 23, stockCars: [hondaCrv], showroomCars: [hondaCivic], cars: [hondaCrv, hondaCivic])
var lexus = Dealership.init(name: "Lexus", showroomCapacity: 3, stockCars: [lexusRx, lexusLc], showroomCars: [lexusLx], cars: [lexusLx,lexusRx])

lexus.addToShowroom(car: lexusLx)
lexus.addToShowroom(car: lexusLc)
lexus.addToShowroom(car: lexusLs)
lexus.presaleService(car: lexusLs)
lexus.sellCar(car: lexusLs)

//Слоганы диллерских центров
var dealershipArray = [bmw, audi, volvo, honda, lexus]
for dealership in dealershipArray {
    if let company = dealership as? Dealership  {
        switch company.name {
        case "BMW": print("A Company of Ideas")
        case "Honda": print("You meet the nicest people on a Honda")
        case "Volvo": print("Volvo.for live")
        case "Audi": print("Vorsprung durch Technik")
        case "Lexus": print("The Passionate Pursuit of Perfection")
        default: print("Диллерский центр не найден")
        }
    }
}
