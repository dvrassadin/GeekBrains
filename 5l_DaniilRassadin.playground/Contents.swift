import UIKit

enum EngineStatus {
    case on, off
}

enum WindowsStatus {
    case open, close
}

enum Action {
    case fillTank(Double)
    case changeTires(String)
}

protocol Car {
    var model: String {get}
    var manufactureYear: Int {get}
    var engineStatus: EngineStatus {get set}
    var windowsStatus: WindowsStatus {get set}
    
    func perform(action: Action)
}

extension Car {
    mutating func switchEngine (action: EngineStatus) {
        if action == .on && engineStatus == .on {
            print("Двигатель уже запущен")
        } else if action == .off && engineStatus == .off {
            print("Двигатель уже сотановлен")
        } else {
            return engineStatus = action
        }
    }
}

extension Car {
    mutating func switchWindows (action: WindowsStatus) {
        if action == .open && windowsStatus == .open {
            print("Окна уже открыты")
        } else if action == .close && windowsStatus == .close {
            print("Окна уже закрыты")
        } else {
            return windowsStatus = action
        }
    }
}


class TankCar: Car {
    var model: String
    var manufactureYear: Int
    var engineStatus: EngineStatus = .off
    var windowsStatus: WindowsStatus = .close
    let tankVolume: Double
    var filledTankVolume: Double = 0
    
    func perform(action: Action) {
        switch action {
        case .fillTank(let liquid):
            let expectedVolume = liquid + filledTankVolume
            if expectedVolume > tankVolume {
                print("Нет столько места")
            } else if expectedVolume < 0 {
                break
            } else {
                filledTankVolume = expectedVolume
                print("Цистерна заполена на \(filledTankVolume) из \(tankVolume).")
            }
        default:
            print("Нельзя выполнить это действие с этим автомобилем.")
        }
    }
    
    init(model: String, manufactureYear: Int, tankVolume: Double) {
        self.model = model
        self.manufactureYear = manufactureYear
        self .tankVolume = tankVolume
    }
    
}


class SportCar: Car {
    var model: String
    var manufactureYear: Int
    var engineStatus: EngineStatus = .off
    var windowsStatus: WindowsStatus = .close
    let maxSpeed: Double
    var tires: String
    
    func perform(action: Action) {
        switch action {
        case .changeTires(let newTires):
            tires = newTires
            print("Теперь стоят шины \(tires).")
        default:
            print("Нельзя выполнить это действие с этим автомобилем.")
        }
    }
    
    init(model: String, manufactureYear: Int, maxSpeed: Double, tires: String) {
        self.model = model
        self.manufactureYear = manufactureYear
        self.maxSpeed = maxSpeed
        self.tires = tires
    }
    
}

extension TankCar: CustomStringConvertible {
    var description: String {
        return "\(model), \(manufactureYear) года выпуска.\nЦистерна заполнена на \(filledTankVolume) из \(tankVolume)."
    }
    
    func printDescription(){
        print(description)
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(model), \(manufactureYear)года выпуска.\nМаксимальная скорость — \(maxSpeed).\nУстановлены покрышки \(tires)."
    }
    
    func printDescription(){
        print(description)
    }
}


var tankCar1 = TankCar(model: "Scania", manufactureYear: 2015, tankVolume: 3000)

tankCar1.perform(action: .fillTank(2000))
tankCar1.switchEngine(action: .on)
tankCar1.printDescription()
