import UIKit
import Foundation
import os
import Darwin
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

    init(categoryName: String) {
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

var rock = Category.init(categoryName: "Rock")
rock.addTrack(track: audioTrack)
rock.addTrack(track: audioTrackSecond)
rock.numbersOfTrack
rock.deleteTrack(track: audioTrack)
rock.addTrack(track: audioTrackThird)
rock.numbersOfTrack

//Задача 2
class Library {
    var category: [Category]
    var numbersOfCategory: Int {
        get {
            category.count
        }
    }

    init(category: [Category]) {
        self.category = category
    }

    func addCategory(category: Category) {
        self.category.append(category)
    }

    func deleteCategory(category: Category) {
        for (numbers, name) in self.category.enumerated() {
            if name.categoryName == category.categoryName {
                self.category.remove(at: numbers)
            }
        }
    }

    func changeCategory(track: Track, categoryOut: Category, categoryIn: Category) {
        for trackName in categoryOut.trackList {
            if trackName.name == track.name, trackName.country == track.country, trackName.performer == track.performer {
                categoryOut.deleteTrack(track: track)
                categoryIn.addTrack(track: track)
            }
            else {
                print("Трек отсутствует в категории")
            }
        }
    }
}

var jazz = Category.init(categoryName: "Jazz")
var pop = Category.init(categoryName: "Pop")
var myLibrary = Library.init(category: [rock, jazz])

myLibrary.addCategory(category: pop)
myLibrary.category
myLibrary.deleteCategory(category: pop)
myLibrary.category
myLibrary.numbersOfCategory

//Задача 3
myLibrary.changeCategory(track: audioTrackSecond, categoryOut: rock, categoryIn: jazz)
