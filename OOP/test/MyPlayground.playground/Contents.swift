import UIKit

//Задача 1
enum CountryList: String {
    case russia = "Russia"
    case usa = "USA"
    case germany = "Germany"
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

var audioTrack = Track.init(name: "My story", performer: "John", duration: 2.34, country: .russia)
var audioTrackSecond = Track.init(name: "Nice song", performer: "Mara", duration: 4.55, country: .usa)
var audioTrackThird = Track.init(name: "Was ist das", performer: "Hans", duration: 3.20, country: .germany)

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

    func addTrack(track: Track) -> String {
        trackList.append(track)
        return "Track add"
    }

    func deleteTrack(track: Track) -> String {
        for (numbers, name) in trackList.enumerated() {
            if name.name == track.name {
                trackList.remove(at: numbers)
            }
        }
        return "Track deleted"
    }
}

var rock = Category.init(categoryName: "Rock", numbersOfTrack: 0)
rock.addTrack(track: audioTrack)
rock.addTrack(track: audioTrackSecond)
rock.numbersOfTrack
rock.deleteTrack(track: audioTrack)
rock.addTrack(track: audioTrackThird)
rock.numbersOfTrack

//Задача 2
class 
