import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func multipleOf(number: Int, factor: Int) -> Bool {
let b = number % factor == 0 ? true : false
return b
}

let a = multipleOf(number: 67, factor: 3)
print(a ? "Кратное" : "Некратное")

//3. Создать возрастающий массив из 100 чисел.

