import UIKit

let timeAndStation = [["Невский проспект": 0],["Сенная площадь" : 3], ["Технологический институт": 7], ["Фрунзенская": 15], ["Московские ворота": 30], ["Электросила": 35], ["Парк победы": 40]]

func travelTime (startStation: String, endStation: String) -> Int{
    var timeOnTravel = 0
    switch startStation {
    case "Невский проспект","Сенная площадь", "Технологический институт","Фрунзенская","Московские ворота", "Электросила", "Парк победы" :
        switch endStation {
        case"Невский проспект","Сенная площадь", "Технологический институт","Фрунзенская","Московские ворота", "Электросила", "Парк победы" :
            for (_, stationDictionary) in timeAndStation.enumerated() {
                for firstStation in stationDictionary.keys {
                    if firstStation == startStation {
                        for (_, secondStationDictionary) in timeAndStation.enumerated() {
                            for secondStation in secondStationDictionary.keys {
                                if secondStation == endStation {
                                    if let timeOnFirstStation = stationDictionary[firstStation], let timeOnSecondStation = secondStationDictionary[secondStation] {
                                        timeOnTravel = timeOnFirstStation - timeOnSecondStation
                                    }
                                }
                            }
                        }
                    }
                }
            }
        default: print("Название станции введено неверно или такая станция отсутствует")
        }
    default: print("Название станции введено неверно или такая станция отсутствует")
    }
    return abs(timeOnTravel)
}

travelTime(startStation: "Фрунзенская", endStation: "Сенная площадь")
