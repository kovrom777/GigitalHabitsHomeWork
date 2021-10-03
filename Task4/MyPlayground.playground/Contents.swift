import UIKit
import Foundation

/**
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */

protocol Profile{
    func printUserData()
}

protocol Adress{
    func printCity()
}

protocol ProtocolsManager{
    associatedtype T: Profile & Adress
}

class Manager1: Adress{
    func printCity() {
        print("Adress manager:\ncity = Moscow")
    }
}

extension Manager1: Profile{
    func printUserData() {
        print("Profile manager:\nname = Name")
    }
}

class Manager: ProtocolsManager{
    typealias T = Manager1
}

let manager = Manager()


/**
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.

 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его



 Формат:
 protocol RequestManager {
     associatedtype Result

     func get() -> Result
 }

 class NetworkManager {
     var requestManager: RequestManager?

     func getAllMovies() {
         requestManager.get()
     }
 }
 */

protocol RequestManager {
     associatedtype Result

    func get() -> Result
 }

class NetworkManager<T> where T: RequestManager{
    var requestManager: T?

    func getAllMovies() {
        requestManager?.get()
    }
}
