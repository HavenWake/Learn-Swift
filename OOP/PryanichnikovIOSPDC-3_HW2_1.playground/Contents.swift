import UIKit

//Задача 1
enum TvChannel: String {
    case BBC = "My amazing planet film"
    case MTV = "Music Awards"
    case History = "History of World War II"
    case Viasat = "Detective Joe"
    case Culture = "Ballet"
}

class Television {
    var firmAndModel: String
    var isOn: Bool
    var currentTvChannel: String

    init(firmAndModel: String, isOn: Bool, currentTvChannel: String) {
        self.firmAndModel = firmAndModel
        self.isOn = isOn
        self.currentTvChannel = currentTvChannel
    }
    func whatOnTv() {
        if self.isOn {
            switch self.currentTvChannel {
            case "BBC": print("My amazing planet film")
            case "MTV": print("Music Awards")
            case "History": print("History of World War II")
            case "Viasat": print("Detective Joe")
            case "Culture": print("Ballet")
            default: print("Channel not found")
            }
        }
        else {
            print("Tv is off")
        }
    }
}

var kitchenTv = Television(firmAndModel: "Samsung GVC100", isOn: true, currentTvChannel: "BBC")

kitchenTv.whatOnTv()
kitchenTv.currentTvChannel = "Culture"
kitchenTv.whatOnTv()
kitchenTv.isOn = false
kitchenTv.whatOnTv()


//Задача 2
struct SettingTv {
    var isZeroVolume: Bool
    var isColorPicture: Bool
}

class TelevisionNew: Television {
    var setting = SettingTv(isZeroVolume: false, isColorPicture: true)
    override func whatOnTv() {
        super.whatOnTv()
        var settingInfo = ""
        if setting.isColorPicture {
            settingInfo += "Изображение на ТВ цветное, "
        }
        else {
            settingInfo += "Изображение на ТВ черно-белое, "
        }
        if setting.isZeroVolume {
            settingInfo += "Уровень звука на ТВ: 0"
        }
        else {
            settingInfo += "Уровень звука на ТВ: 1"
        }
        print(settingInfo)
    }
}

var bedroomTv = TelevisionNew.init(firmAndModel: "LG", isOn: true, currentTvChannel: "BBC")

bedroomTv.whatOnTv()
bedroomTv.currentTvChannel = "MTV"
bedroomTv.setting.isZeroVolume = true
bedroomTv.setting.isColorPicture = false
bedroomTv.whatOnTv()

//Задача 3
enum ChannelAndPort {
    case tvChannel
    case Videoport
}
