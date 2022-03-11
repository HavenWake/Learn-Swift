import UIKit
import Foundation
//Протоколы для машины и диллерского центра
protocol CarProtocol {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
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
    
    func offerAccessories(accessories: [String]) -> [String]
    func presaleService(car: Car) -> Bool
    func addToShowroom(car: Car)
    func sellCar(car: Car)
    func orderCar()
}

//Структура для машин
struct Car: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
//Машины
var audiA5 = Car.init(model: "Audi A5", color: "Red", buildDate: 2021, price: 3670000, accessories: ["Обивка МКПП кожей", "Сигнализация"], isServiced: false)

var audiA3 = Car.init(model: "Audi A3", color: "Blue", buildDate: 2021, price: 3680000, accessories: ["Обивка МКПП кожей"], isServiced: true)

var hondaCrv = Car.init(model: "Honda CR-V", color: "Silver", buildDate: 2022, price: 2320000, accessories: [], isServiced: false)

var hondaCivic = Car.init(model: "Honda Civic", color: "Black", buildDate: 2022, price: 1320000, accessories: [], isServiced: false)

var volvoV60 = Car.init(model: "Volvo V60", color: "Silver", buildDate: 2022, price: 3500000, accessories: ["Сигнализация"], isServiced: true)

var volvoS60 = Car.init(model: "Volvo S60", color: "White", buildDate: 2022, price: 4500000, accessories: ["Сигнализация, Литые диски"], isServiced: true)

var bmwX5 = Car.init(model: "BMW X5", color: "White", buildDate: 2021, price: 6500000, accessories: ["Рейлинги"], isServiced: false)

var bmwX3 = Car.init(model: "BMW X3", color: "Red", buildDate: 2021, price: 5400000, accessories: ["Рейлинги, Зеркала в цвет кузова"], isServiced: false)

var lexusLx = Car.init(model: "Lexus LX", color: "Black", buildDate: 2021, price: 8520000, accessories: ["Литые диски"], isServiced: false)

var lexusRx = Car.init(model: "Lexus RX", color: "Sky Blue", buildDate: 2021, price: 7320000, accessories: [], isServiced: true)

var lexusLc = Car.init(model: "Lexus LC", color: "Red", buildDate: 2022, price: 2450000, accessories: [], isServiced: true)

var lexusLs = Car.init(model: "Lexus LS", color: "Night Blue", buildDate: 2021, price: 4320000, accessories: [], isServiced: false)


//Протокол спецаильного предложения

protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}

//Класс для диллерских центров
class Dealership: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) -> [String] {
        print("Приобретите дополнительное оборудование: \(accessories)")
        return accessories
    }

    func addAccessories(numberOfCar: Int, accessories: [String]) {
        cars[numberOfCar].accessories += accessories
    }
    
    func presaleService(car: Car) -> Bool {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        return true
    }
    func addToShowroom(car: Car) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: Car) {
        if presaleService(car: car) {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += offerAccessories(accessories: ["Обивка МКПП кожей", "Обивка руля кожей"])
                        print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                        showroomCars.remove(at: numberOfCar)
                        cars =  showroomCars + stockCars
                    }
                }
            }
        }
        else {
            print("Предпродажная подготовка не выполнена, машина \(car.model) не готова к продаже")
        }
    }
    func orderCar() {
        let lexusLm = Car.init(model: "Lexus LSS", color: "red", buildDate: 2021, price: 9000000, accessories: [], isServiced: false)
        self.stockCars.append(lexusLm)
        cars =  showroomCars + stockCars
        print("Автомобиль заказан на склад")
    }
}

extension Dealership: SpecialOffer {
    func addEmergencyPack() {

    }
    
    func makeSpecialOffer() {
        for (numberOfCar, nameCar) in cars.enumerated() {
            if nameCar.buildDate < 2022 {
                cars[numberOfCar].price -= cars[numberOfCar].price / 100 * 15
                print("На автомобиль \(cars[numberOfCar]) действует скидка 15%")
                addToShowroom(car: cars[numberOfCar])
                addEmergencyPack()
            }
        }
    }
}
//Диллерские центры
var bmw = Dealership.init(name: "BMW", showroomCapacity: 12, stockCars: [bmwX5], showroomCars: [bmwX3])
var audi = Dealership.init(name: "Audi", showroomCapacity: 10, stockCars: [audiA3], showroomCars: [audiA5])
var volvo = Dealership.init(name: "Volvo", showroomCapacity: 8, stockCars: [volvoS60], showroomCars: [volvoV60])
var honda = Dealership.init(name: "Honda", showroomCapacity: 23, stockCars: [hondaCrv], showroomCars: [hondaCivic])
var lexus = Dealership.init(name: "Lexus", showroomCapacity: 3, stockCars: [lexusRx, lexusLc], showroomCars: [lexusLx])

lexus.addToShowroom(car: lexusLx)
print(lexus.stockCars)
lexus.addToShowroom(car: lexusLc)
print(lexus.stockCars)
lexus.addToShowroom(car: lexusLs)
lexus.presaleService(car: lexusLs)
lexus.sellCar(car: lexusLc)
lexus.orderCar()
print(lexus.cars)
lexus.makeSpecialOffer()
lexus.showroomCars

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

