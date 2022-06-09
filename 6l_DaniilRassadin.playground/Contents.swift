import UIKit
import Foundation
import Darwin

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Queue<T> {
    var elements = [T]()
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T {
        return elements.removeFirst()
    }
}

var queueInt = Queue<Int>()
queueInt.push(5)
queueInt.push(20)
queueInt.push(99)
queueInt.push(50)
queueInt.push(33)
queueInt.push(8)
queueInt.push(105)
queueInt.push(1)
queueInt.push(0)
queueInt.push(4)
queueInt.push(789)
queueInt.push(340)
print(queueInt.elements)
queueInt.pop()
print(queueInt.elements)

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

let over100: (Int) -> Bool = { (element: Int) -> Bool in
    return element > 100
}

let less100: (Int) -> Bool = { (element: Int) -> Bool in
    return element < 100
}


func filter(array: [Int], predicate: (Int) -> Bool) -> [Int] {
    var tmpArray = [Int]()
    for i in array {
        if predicate(i) {
            tmpArray.append(i)
        }
    }
    return tmpArray
}


print(filter(array: queueInt.elements, predicate: over100))
print(filter(array: queueInt.elements, predicate: less100))

print(queueInt.elements.sorted() {$0 < $1})
print(filter(array: queueInt.elements) {$0 % 5 == 0})

//3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Apples {
    var apple1: String? = "Abram"
    var apple2: String? = "Bledsoe"
    var apple3: String? = "Houblon"
    
    subscript(i: Int) -> String? {
        get {
            switch i {
            case 0: return apple1
            case 1: return apple2
            case 2: return apple3
            default: return nil
            }
        }
        set {
            switch i {
            case 0: apple1 = newValue
            case 1: apple2 = newValue
            case 2: apple3 = newValue
            default: break
            }
        }
    }
}

var ENapple = Apples()

print(ENapple[2] ?? "Такого индекса нет.")
print(ENapple[5] ?? "Такого индекса нет.")
