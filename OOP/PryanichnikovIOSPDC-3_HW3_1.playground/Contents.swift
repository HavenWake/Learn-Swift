import UIKit
import Foundation
import Darwin

//Задача 1 и 2

class Artist {
    let name: String
    let country: String
    let genre: String
    
    init(name: String, country: String, genre: String) {
        self.name = name
        self.country = country
        self.genre = genre
    }
    
    func writeText(track: String) {
        print("Я \(name) написал трек \(track)")
    }
    
    func playTrack(track: String) {
        print("Я \(name) исполнил трек \(track)")
    }
}

final class PopArtist: Artist {
    let age = 26
    
    func PrintMyAge() {
        print(age)
    }
    
    override func writeText(track: String) {
        print("Трек \(track) написал артист \(name)")
    }
    
    override func playTrack(track: String) {
        print("Трек \(track) исполнил артист \(name)")
    }
}

final class RockArtist: Artist {
    let experience = 5
    
    func printMyExpirience() {
        print(experience)
    }
    
    override func writeText(track: String) {
        print("Я \(name) из страны \(country) написал трек \(track)")
    }
    override func playTrack(track: String) {
        print("Я \(name) из страны \(country) исполнил трек \(track)")
    }
}

final class JazzArtist: Artist {
    let idol = "Луи Армстронг"
    
    func printMyIdol() {
        print(idol)
    }
    
    override func writeText(track: String) {
        super.writeText(track: track)
        print("в жанре \(genre)")
    }
    override func playTrack(track: String) {
        super.playTrack(track: track)
        print("в жанре \(genre)")
    }
}

var John = RockArtist.init(name: "John", country: "USA", genre: "Jazz")
John.playTrack(track: "my jazz track")
John.printMyExpirience()
