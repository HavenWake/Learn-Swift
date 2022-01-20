import UIKit

let stationAndTime = [["Невский проспект", "Сенная площадь", "Технологический институт", "Фрунзенская", "Московские ворота", "Электросила", "Парк победы"], ["0", "3", "7", "15", "30", "35", "40"]]

func timeOnTravel (stationFrom: String, stationWhere: String) -> Int{
    var firstStationNumber = 0
    var secondStationNumber = 0
    var ai = 0
    for (numberOfStation, nameOfStation) in stationAndTime[0].enumerated(){
        if nameOfStation == stationFrom{
            firstStationNumber = numberOfStation
            break
        }
    }
    for (numberOfStation, nameOfStation) in stationAndTime[0].enumerated(){
        if nameOfStation == stationWhere{
            secondStationNumber = numberOfStation
            break
        }
    }
    print(firstStationNumber, secondStationNumber)
    if firstStationNumber - secondStationNumber < 0{
        if let timeOnTravel = Int(stationAndTime[1][firstStationNumber]), let timeOnTravel = Int(stationAndTime[1][secondStationNumber]){
            ai = timeOnTravel
        }

    }
    /*if stationFrom == "Невский проспект" || stationWhere == "Невский проспект"{
        numberOfStation = 1
    }
    else if stationFrom == "Сенная площадь" || stationWhere == "Сенная площадь"{
        numberOfStation = 2
    }
    else if stationFrom == "Технологический институт"{
        numberOfStation = 3
    }
    else if stationFrom == "Фрунзенская"{
        numberOfStation = 4
    }
    else if stationFrom == "Московские ворота"{
        numberOfStation = 5
    }
    else if stationFrom == "Элетросила"{
        numberOfStation = 6
    }
    else if stationFrom == "Парк победы"{
        numberOfStation = 7
    }*/


    return ai
}

timeOnTravel(stationFrom: "Сенная площадь", stationWhere: "Электросила")
