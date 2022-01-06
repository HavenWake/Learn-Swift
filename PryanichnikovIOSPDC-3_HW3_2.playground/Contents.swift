import UIKit

//Задача 1
var myFavorite = (film: "Harry Potter", number: 9, dish: "Cherry pie")
let (myFilm, myNumber, myDish) = myFavorite
var hisFavorite = (film: "Iron Man", number: 13, dish: "Pancakes")
var anotherFavorite = myFavorite

myFavorite = hisFavorite
hisFavorite = anotherFavorite

let numberFavorite = (myFavorite.number, hisFavorite.number, myFavorite.number - hisFavorite.number)

print(numberFavorite)

//Задача 2
let schoolLesson = ["Russian language": 5, "Biology": 4, "Geography": 4]
let schoolDiary = ["Sam": schoolLesson]

//Задача 3
typealias Chessman = [String: (alpha:Character, num: Int)?]
var chessmans: Chessman
chessmans = ["Белый король": ("A", 6), "Черный конь": ("H", 1), "Белый слон": nil]

if let info = chessmans["Белый король"]{
    if info != nil{
        print("Координаты фигуры: \(info!)")
    }
    else{
        print("Фигура отсутствует на поле")
    }
}

//Задача 4
for (chessPiece, _) in chessmans{
    if let info = chessmans[chessPiece]{
        if info != nil{
            print("Координаты фигуры \(chessPiece): \(info!)")
        }
        else{
            print("Фигура \(chessPiece) отсутствует на поле")
        }
    }
}
