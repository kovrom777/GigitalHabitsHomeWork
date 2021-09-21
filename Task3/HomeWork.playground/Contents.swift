import UIKit
import Foundation

/**
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.

  Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
  Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
  Код [55555].testFunc(count: "5") должен возвращать 5
  Код [55555].testFunc(count: "1") должен возвращать 0.
 */

extension Array{
    func testFunc(count: String) -> Int{
        var res = 0
        for elem in self{
            let charArray = String(describing: elem).map({String($0)})
            res += charArray.filter({$0 == count}).count
        }
        return res
    }
}

//print([5, 15, 55, 515].testFunc(count: "5")) // 6
//print([5, 15, 55, 515].testFunc(count: "1")) // 2


/**
 2. Отсортировать массив по длине строк его значений

 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 */

extension Array where Element == String{
    
    /*
     * Стандартная функция sorted(by:) отработала неправильно, из-за чего пришлось написать свою  реализацию
     * Реализация задания в виде self.sorted(by:) постоянно возвращала неверный результат: ["ab", "abc", "a"]
     * Вследствие чего пришлось использовать небольшой костыль
     */
    
    mutating func testSorted(){
        var dopArr = self
        dopArr.sort(by: {$0.count > $1.count})
        self = dopArr
        //self.sort(by: {$0.count > $1.count})
    }
}

var arr = ["a", "abc", "ab"]
arr.testSorted()

/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 

 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)

 getMissingNumbers(input: testArray) // [7, 21, 26]
 */

func getMissingNumbers(input: [Int]) -> [Int]{
    var res = [Int]()
    var lastElem = 1
    for _ in 1...100{
        if !input.contains(lastElem){
            res.append(lastElem)
        }
        lastElem += 1
    }
    return res
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)
getMissingNumbers(input: testArray)

/**
 4. Поменять значения массива местами (не использовать reverse)
 Пример:
 var array = [1, 2, 3]
 array.testReverse()

 */

extension Array{
    mutating func testReverse(){
        for i in 0..<self.count / 2{
            self.swapAt(i, self.count - i - 1)
        }
    }
}

/**
 Решите проблему сильных ссылок
 */

class Person {
  let name: String
  let email: String
  weak var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil
