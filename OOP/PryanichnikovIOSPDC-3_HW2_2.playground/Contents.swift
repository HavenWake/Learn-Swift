import UIKit
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
        return "Track deleted"
    }
}

var categoryRock = Category.init(categoryName: "Rock", numbersOfTrack: 0)
categoryRock.addTrack(Track: AudioTrack)
categoryRock.addTrack(Track: AudioTrack)
categoryRock.numbersOfTrack
//Задача 2

