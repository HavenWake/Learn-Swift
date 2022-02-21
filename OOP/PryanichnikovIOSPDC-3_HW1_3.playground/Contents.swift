import UIKit

//Задача 1
//Класс компьютер
//Имеет публичный доступ т.к отдельный объектом компьютер может воспользоваться любой (может иметь и приватный доступ, но допустим что в нашей ситуации в офисе есть много ПК и любой человек может работать за любым ПК под своей учетной записью)
//Геттер: узнать информацию об учетной записи пользователя
//Сеттер: ввести логин и пароль
//Публичный метод: показать приветственный экран
//Приватный метод: поместить данные в оперативную память


//Задача 2
class WatchFive {
    func displayTime(hour: Int, minutes: Int) {
        
    }
    func displayTime(hour: String, minutes: String) -> Bool {
        return true
    }
    func displayTime(hour: Int, minutes: Int) -> String {
        return ""
    }
}

//Задача 3
class Watch {
    func displayTime(hour: Int, minutes: Int) {
        
    }
}

class AppleWatch: Watch {
    override func displayTime(hour: Int, minutes: Int) {
        super.displayTime(hour: hour, minutes: minutes)
        print("Override!")
    }
}

