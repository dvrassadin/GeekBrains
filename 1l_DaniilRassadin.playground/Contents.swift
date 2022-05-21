import UIKit

// Решение квадратного уравнения

let a: Double = 8 //произвольное число не равное 0
let b: Double = 3 //произвольное число
let c: Double = 4 //произвольное число

let D: Double = b*b-4*a*c //дискриминант
print("дискриминант: \(D)")

if a == 0 {
    print("а не должна равняться нулю")
} else if D < 0 {
    print("корней нет")
} else if D == 0 {
    let x = (-b + sqrt(D)) / (2 * a)
    print("есть один корень — \(x)")
} else if D > 0 {
    let x1 = (-b + sqrt(D)) / (2 * a)
    let x2 = (-b - sqrt(D)) / (2 * a)
    print("есть два различных корня: \(x1) и \(x2)")
}

// Прямоугольный треугольник

let aT: Double = 1 //катет
let bT: Double = 3 //катет

let cT: Double = sqrt(aT * aT + bT * bT) //гипотенуза
let ST: Double = (aT * bT) / 2 //площадь
let PT: Double = aT + bT + cT // периметр

print("площадь треугольника: \(ST)")
print("периметр треугольника: \(PT)")
print("гипотенуза треугольника: \(cT)")


//Вклад на 5 лет (с ежемесячной капитализацией без учёта високосных лет)

let sumStart: Double = 1002 //сумма вклада
let percAnnum: Double = 10 //процент годовых

let sumEnd: Double = sumStart * pow((1 + (percAnnum / 100) / 365), 1825) //1825 — количество дней в 5 годах, формула с сайте Райффайзена

print("через 5 лет сумма Вашего вклада будет \(round(sumEnd))")
