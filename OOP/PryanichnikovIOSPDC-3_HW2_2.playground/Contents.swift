import UIKit
import Foundation
//Задача 1
enum CountryList: String {
    case Russia = "Russia"
    case USA = "USA"
    case Germany = "Germany"
}

struct Track {
    var name: String
    var performer: String
    var duration: Double
    var country: CountryList


    init(name: String, performer: String, duration: Double, country: CountryList) {
        self.performer = performer
        self.duration = duration
        self.name = name
        self.country = country
    }

}

var AudioTrack = Track.init(name: "My story", performer: "John", duration: 2.34, country: .Russia)
var AudioTrackTwo = Track.init(name: "Nice song", performer: "Mara", duration: 4.55, country: .USA)

class Category {
    var categoryName: String
    lazy var trackList = [Track]()
    var numbersOfTrack: Int {
        get {
            trackList.count
        }
    }

    init(categoryName: String, numbersOfTrack: Int) {
        self.categoryName = categoryName
    }

    func addTrack(Track: Track) -> String {
        trackList.append(Track)
        return "Track add"
    }

    func deleteTrack(Track: Track) -> String {
        for (numbers, name) in trackList.enumerated() {
            if name.name == Track.name {
                trackList.remove(at: numbers)
            }
        }
        return "Track deleted"
    }
}

var categoryRock = Category.init(categoryName: "Rock", numbersOfTrack: 0)
categoryRock.addTrack(Track: AudioTrack)
categoryRock.addTrack(Track: AudioTrackTwo)
categoryRock.numbersOfTrack
categoryRock.deleteTrack(Track: AudioTrack)
categoryRock.numbersOfTrack

//Задача 2
class Library {
    
}
