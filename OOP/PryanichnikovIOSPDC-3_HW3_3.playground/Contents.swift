import UIKit

//Протоколы для машин и диллерских центров
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
    var stockCars: [CarProtocol] { get set }
    var showroomCars: [CarProtocol] { get set }
    var cars: [CarProtocol] { get set }
    
    func offerAccessories(accessories: [String])
    func presaleService(car: inout CarProtocol)
    func addToShowroom(car: inout CarProtocol)
    func sellCar(car:  inout CarProtocol)
    func orderCar()
}

//Структуры для машин и машины
struct Audi: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
var audiA5: CarProtocol = Audi.init(model: "Audi A5", color: "Red", buildDate: 2021, price: 3670000, accessories: ["Обивка МКПП кожей", "Сигнализация"], isServiced: false)

var audiA3: CarProtocol = Audi.init(model: "Audi A3", color: "Blue", buildDate: 2022, price: 3680000, accessories: [], isServiced: true)

struct Bmw: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
var bmwX5: CarProtocol = Bmw.init(model: "BMW X5", color: "White", buildDate: 2021, price: 6500000, accessories: ["Рейлинги"], isServiced: false)

var bmwX3: CarProtocol = Bmw.init(model: "BMW X3", color: "Red", buildDate: 2021, price: 5400000, accessories: ["Рейлинги, Зеркала в цвет кузова"], isServiced: false)

struct Honda: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
var hondaCrv: CarProtocol = Honda.init(model: "Honda CR-V", color: "Silver", buildDate: 2022, price: 2320000, accessories: [], isServiced: false)

var hondaCivic: CarProtocol = Honda.init(model: "Honda Civic", color: "Black", buildDate: 2022, price: 1320000, accessories: [], isServiced: false)

struct Lexus: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
var lexusLx: CarProtocol = Lexus.init(model: "Lexus LX", color: "Black", buildDate: 2021, price: 8520000, accessories: ["Литые диски"], isServiced: false)

var lexusRx: CarProtocol = Lexus.init(model: "Lexus RX", color: "Sky Blue", buildDate: 2021, price: 7320000, accessories: [], isServiced: true)

var lexusLc: CarProtocol = Lexus.init(model: "Lexus LC", color: "Red", buildDate: 2022, price: 2450000, accessories: [], isServiced: true)

var lexusLs: CarProtocol = Lexus.init(model: "Lexus LS", color: "Night Blue", buildDate: 2021, price: 4320000, accessories: [], isServiced: false)

struct Volvo: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}
var volvoV60: CarProtocol = Volvo.init(model: "Volvo V60", color: "Silver", buildDate: 2022, price: 3500000, accessories: ["Сигнализация"], isServiced: true)

var volvoS60: CarProtocol = Volvo.init(model: "Volvo S60", color: "White", buildDate: 2022, price: 4500000, accessories: ["Сигнализация, Литые диски"], isServiced: true)

//Классы для диллерских центров центры
class AudiCentre: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]
    
    init(name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) {
        print("Приобретите дополнительное оборудование: \(accessories)")
    }
    
    func presaleService(car: inout CarProtocol) {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        car.isServiced = true
    }
    func addToShowroom(car: inout CarProtocol) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: &car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: inout CarProtocol) {
        if car.isServiced == true {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += ["Хромированные пороги", "Чехол для очков"]
                    }
                    print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                    showroomCars.remove(at: numberOfCar)
                    cars =  showroomCars + stockCars
                }
            }
        }
        else {
            print("Предпродажная подготовка автомобиля \(car.model) не проведена, автомобиль не готов к продаже")
        }
    }
    func orderCar() {
        let audiAs = Audi.init(model: "Audi AS", color: "blue", buildDate: 2022, price: 8500000, accessories: [], isServiced: false)
        self.stockCars.append(audiAs)
        cars =  showroomCars + stockCars
        print("Автомобиль \(audiAs) заказан на склад")
    }
}

class BmwCentre: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]
    
    init(name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) {
        print("Приобретите дополнительное оборудование: \(accessories)")
    }
    
    func presaleService(car: inout CarProtocol) {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        car.isServiced = true
    }
    func addToShowroom(car: inout CarProtocol) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: &car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: inout CarProtocol) {
        if car.isServiced == true {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += ["Хромированные пороги", "Чехол для очков"]
                    }
                    print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                    showroomCars.remove(at: numberOfCar)
                    cars =  showroomCars + stockCars
                }
            }
        }
        else {
            print("Предпродажная подготовка автомобиля \(car.model) не проведена, автомобиль не готов к продаже")
        }
    }
    func orderCar() {
        let bmwX3 = Bmw.init(model: "bmw X3", color: "red", buildDate: 2021, price: 8700000, accessories: [], isServiced: false)
        self.stockCars.append(bmwX3)
        cars =  showroomCars + stockCars
        print("Автомобиль \(bmwX3) заказан на склад")
    }
}

class VolvoCentre: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]
    
    init(name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) {
        print("Приобретите дополнительное оборудование: \(accessories)")
    }
    
    func presaleService(car: inout CarProtocol) {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        car.isServiced = true
    }
    func addToShowroom(car: inout CarProtocol) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: &car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: inout CarProtocol) {
        if car.isServiced == true {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += ["Хромированные пороги", "Чехол для очков"]
                    }
                    print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                    showroomCars.remove(at: numberOfCar)
                    cars =  showroomCars + stockCars
                }
            }
        }
        else {
            print("Предпродажная подготовка автомобиля \(car.model) не проведена, автомобиль не готов к продаже")
        }
    }
    func orderCar() {
        let volvoLf = Volvo.init(model: "Volvo LF", color: "green", buildDate: 2021, price: 4500000, accessories: [], isServiced: false)
        self.stockCars.append(volvoLf)
        cars =  showroomCars + stockCars
        print("Автомобиль \(volvoLf) заказан на склад")
    }
}

class HondaCentre: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]
    
    init(name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) {
        print("Приобретите дополнительное оборудование: \(accessories)")
    }
    
    func presaleService(car: inout CarProtocol) {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        car.isServiced = true
    }
    func addToShowroom(car: inout CarProtocol) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: &car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: inout CarProtocol) {
        if car.isServiced == true {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += ["Хромированные пороги", "Чехол для очков"]
                    }
                    print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                    showroomCars.remove(at: numberOfCar)
                    cars =  showroomCars + stockCars
                }
            }
        }
        else {
            print("Предпродажная подготовка автомобиля \(car.model) не проведена, автомобиль не готов к продаже")
        }
    }
    func orderCar() {
        let hondaAccord = Honda.init(model: "Honda Accord", color: "silver", buildDate: 2022, price: 3500000, accessories: [], isServiced: false)
        self.stockCars.append(hondaAccord)
        cars =  showroomCars + stockCars
        print("Автомобиль \(hondaAccord) заказан на склад")
    }
}

class LexusCentre: DealershipProtocol {
    var name: String
    var showroomCapacity: Int
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]
    
    init(name: String, showroomCapacity: Int, stockCars: [CarProtocol], showroomCars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }
    
    func offerAccessories(accessories: [String]) {
        print("Приобретите дополнительное оборудование: \(accessories)")
    }
    
    func presaleService(car: inout CarProtocol) {
        print("Автомобиль \(car) отправлен на предпродажную подготовку")
        car.isServiced = true
    }
    func addToShowroom(car: inout CarProtocol) {
        for (numberOfCar, nameCar) in stockCars.enumerated() {
            if self.showroomCars.count < showroomCapacity, nameCar.model == car.model {
                presaleService(car: &car)
                self.showroomCars.append(car)
                self.stockCars.remove(at: numberOfCar)
                print("Машина \(car.model) отправлена с парковки в автосалон, проведена предпродажная подготовка")
            }
        }
    }
    func sellCar(car: inout CarProtocol) {
        if car.isServiced == true {
            for (numberOfCar, nameCar) in showroomCars.enumerated() {
                if nameCar.model == car.model {
                    if nameCar.accessories == [] {
                        showroomCars[numberOfCar].accessories += ["Хромированные пороги", "Чехол для очков"]
                    }
                    print("Проведена предпродажная подготовка, машина \(showroomCars[numberOfCar]) продана из салона")
                    showroomCars.remove(at: numberOfCar)
                    cars =  showroomCars + stockCars
                }
            }
        }
        else {
            print("Предпродажная подготовка автомобиля \(car.model) не проведена, автомобиль не готов к продаже")
        }
    }
    func orderCar() {
        let lexusLL = Audi.init(model: "Audi LL", color: "black", buildDate: 2022, price: 9500000, accessories: ["Подсветка салона"], isServiced: false)
        self.stockCars.append(lexusLL)
        cars =  showroomCars + stockCars
        print("Автомобиль \(lexusLL) заказан на склад")
    }
}


//Экземпляры диллерских центров
var audiAutoCentre = AudiCentre.init(name: "Audi Auto Centre", showroomCapacity: 12, stockCars: [audiA5], showroomCars: [audiA3])
var bmwAutoCentre = BmwCentre.init(name: "Bmw Auto Centre", showroomCapacity: 10, stockCars: [bmwX3], showroomCars: [bmwX5])
var volvoAutoCentre = VolvoCentre.init(name: "Volvo Auto Centre", showroomCapacity: 6, stockCars: [volvoS60], showroomCars: [volvoV60])
var hondaAutoCentre = HondaCentre.init(name: "Honda Auto Centre", showroomCapacity: 5, stockCars: [hondaCivic], showroomCars: [hondaCrv])
var lexusAutoCentre = LexusCentre.init(name: "Audi Auto Centre", showroomCapacity: 3, stockCars: [lexusLs, lexusLc], showroomCars: [lexusRx, lexusRx])

//Поэкспериментировать с методами
lexusAutoCentre.stockCars
lexusAutoCentre.showroomCars
lexusLc.isServiced
lexusAutoCentre.addToShowroom(car: &lexusLc)
lexusAutoCentre.addToShowroom(car: &lexusLs)
lexusAutoCentre.stockCars
lexusAutoCentre.showroomCars
lexusAutoCentre.sellCar(car: &lexusLc)
lexusAutoCentre.orderCar()

//Слоганы диллерских центров
var dealershipArray = [audiAutoCentre, bmwAutoCentre, volvoAutoCentre, hondaAutoCentre, lexusAutoCentre] as [DealershipProtocol]
for dealership in dealershipArray {
    switch dealership.name {
    case "Bmw Auto Centre": print("A Company of Ideas")
    case "Honda Auto Centre": print("You meet the nicest people on a Honda")
    case "Volvo Auto Centre": print("Volvo.for live")
    case "Audi Auto Centre": print("Vorsprung durch Technik")
    case "Lexus Auto Centre": print("The Passionate Pursuit of Perfection")
    default: print("Диллерский центр не найден")
    }
}

//Протокол специального предложения
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}

extension AudiCentre: SpecialOffer {
    func addEmergencyPack() {
        for (numberOfCar, _) in cars.enumerated() {
            cars[numberOfCar].accessories += ["Аптечка, огнетушитель"]
        }
    }
    
    func addAccessories(car: inout CarProtocol, acessories: [String]) {
        car.accessories += acessories
    }
    
    func makeSpecialOffer() {
        for (numberOfCar, nameCar) in cars.enumerated() {
            if nameCar.buildDate < 2022 {
                cars[numberOfCar].price -= cars[numberOfCar].price / 100 * 15
                addToShowroom(car: &cars[numberOfCar])
                addEmergencyPack()
                print("На автомобиль \(cars[numberOfCar].model) действует скидка 15%")
            }
        }
    }
}

extension VolvoCentre: SpecialOffer {
    func addEmergencyPack() {
        for (numberOfCar, _) in cars.enumerated() {
            cars[numberOfCar].accessories += ["Аптечка, огнетушитель"]
        }
    }
    
    func addAccessories(car: inout CarProtocol, acessories: [String]) {
        car.accessories += acessories
    }
    
    func makeSpecialOffer() {
        for (numberOfCar, nameCar) in cars.enumerated() {
            if nameCar.buildDate < 2022 {
                cars[numberOfCar].price -= cars[numberOfCar].price / 100 * 15
                addToShowroom(car: &cars[numberOfCar])
                addEmergencyPack()
                print("На автомобиль \(cars[numberOfCar].model) действует скидка 15%")
            }
        }
    }
}

extension LexusCentre: SpecialOffer {
    func addEmergencyPack() {
        for (numberOfCar, _) in cars.enumerated() {
            cars[numberOfCar].accessories += ["Аптечка, огнетушитель"]
        }
    }
    
    func addAccessories(car: inout CarProtocol, acessories: [String]) {
        car.accessories += acessories
    }
    
    func makeSpecialOffer() {
        for (numberOfCar, nameCar) in cars.enumerated() {
            if nameCar.buildDate < 2022 {
                cars[numberOfCar].price -= cars[numberOfCar].price / 100 * 15
                addToShowroom(car: &cars[numberOfCar])
                addEmergencyPack()
                print("На автомобиль \(cars[numberOfCar].model) действует скидка 15%")
            }
        }
    }
}


audiAutoCentre.makeSpecialOffer()
lexusAutoCentre.makeSpecialOffer()
volvoAutoCentre.makeSpecialOffer()
