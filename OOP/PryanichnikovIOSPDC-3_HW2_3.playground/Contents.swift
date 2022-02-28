import UIKit
import Foundation

//Задача 1

let multiplyCalculation = { (sateliteMass: Double, flightLength: Double) -> Double in
    return sateliteMass * flightLength
}
let additionCalculation = { (sateliteMass: Double, flightLength: Double) -> Double in
    return sateliteMass + flightLength
}

func fuelQuantity (calculation: (Double, Double) -> Double ) {
    print(calculation(4.54, 6.76))
}

fuelQuantity(calculation: multiplyCalculation)
fuelQuantity(calculation: additionCalculation)

//Задача 2

let multiplyCalculationReduction: (Double, Double) -> Double = {
    $0 * $1
}
let additionCalculationReduction: (Double, Double) -> Double = {
    $0 + $1
}

func fuelQuantityReduction (calculation: (Double, Double) -> Double ) {
    print(calculation(4.54, 6.76))
}

fuelQuantityReduction(calculation: multiplyCalculationReduction)
fuelQuantityReduction(calculation: additionCalculationReduction)

//Задача 3
//Пункт 1
fuelQuantity { $0 + $1 }
fuelQuantity { $0 * $1 }

//Пункт 2
func example(param: () -> Void) {
    // ...
}

example {
    // ...
}

//В этом примере в качестве единственного и последнего входного параметра используется клоужер, а значит при использовании синтаксиса trailing closures мы можем опустить имя параметра выписав клоужер отдельно, приналичии параметров перед ним, параметры бы выписывались в круглые скобки а клоужер отдельно в фигурных
