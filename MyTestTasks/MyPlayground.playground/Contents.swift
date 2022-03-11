import UIKit
//Опишите алгоритм разбиения массива длины N на k подмассивов так, чтобы размер самого длинного и самого короткого подмассива отличалась не больше чем на 1. Чему будут равны длины подмассивов? .Может ли k быть больше длины N?

var podmass = [[Int](), [Int]()]
let mass = [1,2,3,4,5,6,7,8,9,10,11,12,13,4252,635456356,4564574,765765,756,75,67,567,567,567,56,756,756,7,568,56,8764754,36,456,356,35,63,56,34]
mass.count
let lengthMass1 = mass.count / 2

for (number, _) in mass.enumerated() {
    if number < lengthMass1 {
        podmass[0].append(mass[number])
    }
    else {
        podmass[1].append(mass[number])
    }
}

print(podmass)
