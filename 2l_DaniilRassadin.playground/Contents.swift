import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func multipleOf(number: Int, factor: Int) -> Bool {
return number % factor == 0
}

let a = multipleOf(number: 66, factor: 3)
print(a ? "Кратное" : "Некратное")


//3. Создать возрастающий массив из 100 чисел.

var array = [Int]()

for i in (0...99) {
    array.append(i + 1)
}

print(array)
print("––––––––––")


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for i in array {
    if multipleOf(number: i, factor: 2) == true {
        array.remove(at: array.firstIndex(of: i)!) //функцию взял из методички и не понял как она работает, буду рад если объясните на уроке
    } else if multipleOf(number: i, factor: 3) == false {
        array.remove(at: array.firstIndex(of: i)!)
    }
}

print(array)
print("––––––––––")


//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

var arrayFib = [0, 1]

for i in 0...49 {
    arrayFib.append(arrayFib[0 + i] + arrayFib[1 + i])
}

print(arrayFib)

//6. * Заполнить массив элементов различными простыми числами.

var arrayPrime = [Int]()
var p = 2

for i in (1...100) {
    arrayPrime.append(i + 1)
}

//Больше не осилил. =(
