import UIKit

let timeAndStation = [["Невский проспект": 0],["Сенная площадь" : 3], ["Технологический институт": 7], ["Фрунзенская": 15], ["Московские ворота": 30],
                      ["Электросила": 35], ["Парк победы": 40]]

func travelTime (startStation: String, endStation: String) -> Int{
    var timeOnTravel = 0
    switch startStation{
    case "Невский проспект","Сенная площадь", "Технологический институт","Фрунзенская","Московские ворота", "Электросила", "Парк победы" :
        switch endStation{
        case"Невский проспект","Сенная площадь", "Технологический институт","Фрунзенская","Московские ворота", "Электросила", "Парк победы" :
            for (numberOfFirstStation, stationDictionary) in timeAndStation.enumerated(){
                for (firstStation) in stationDictionary.keys{
                    if firstStation == startStation{
                        for (numberOfSecondStation, secondStationDictionary) in timeAndStation.enumerated(){
                            for (secondStation) in secondStationDictionary.keys{
                                if secondStation == endStation{
                                    if let timeOnFirstStation = stationDictionary[firstStation], let timeOnSecondStation = secondStationDictionary[secondStation]{
                                        if numberOfFirstStation - numberOfSecondStation > 0{
                                            timeOnTravel = timeOnFirstStation - timeOnSecondStation
                                            print("От станции \(startStation) до станции \(endStation) \(timeOnTravel) минут")
                                            return timeOnTravel
                                        }
                                        else{
                                            timeOnTravel = timeOnSecondStation - timeOnFirstStation
                                            print("От станции \(startStation) до станции \(endStation) \(timeOnTravel) минут")
                                            return timeOnTravel
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        default: print("Название станции введено неверно")
        }
    default: print("Название станции введено неверно")
    }
    return timeOnTravel
}

travelTime(startStation: "Сенная площадь", endStation: "Московские ворота")
