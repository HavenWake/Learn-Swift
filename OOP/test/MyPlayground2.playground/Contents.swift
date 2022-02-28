import UIKit

enum TvChannel: String {
    case bbc = "My amazing planet film"
    case mtv = "Music Awards"
    case history = "History of World War II"
    case viasat = "Detective Joe"
    case culture = "Ballet"
}

class Television {
    var firmAndModel: String
    var isOn: Bool
    var currentTvChannel: TvChannel

    init(firmAndModel: String, isOn: Bool, currentTvChannel: TvChannel) {
        self.firmAndModel = firmAndModel
        self.isOn = isOn
        self.currentTvChannel = currentTvChannel
    }
    func whatOnTv() {
        if self.isOn {
            switch currentTvChannel {
            case .bbc: print("Сейчас в эфире: \(TvChannel.bbc.rawValue)")
            case .culture: print("Сейчас в эфире: \(TvChannel.culture.rawValue)")
            case .mtv: print("Сейчас в эфире: \(TvChannel.mtv.rawValue)")
            case .history: print("Сейчас в эфире: \(TvChannel.history.rawValue)")
            case .viasat: print("Сейчас в эфире: \(TvChannel.viasat.rawValue)")
            }
        }
        else {
            print("Tv is off")
        }
    }
}

var kitchenTv = Television(firmAndModel: "Samsung GVC100", isOn: true, currentTvChannel: .mtv)

kitchenTv.whatOnTv()
kitchenTv.currentTvChannel = .culture
kitchenTv.whatOnTv()
kitchenTv.isOn = false
kitchenTv.whatOnTv()

