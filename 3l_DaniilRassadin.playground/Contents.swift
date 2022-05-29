import UIKit

struct Cars {
    enum engine {
        case start, stop
    }

    enum windows {
        case open, closed
    }
  
    let model: String
    let year: Int
    let trunkVolume: Double
    var filledTrunkVolume: Double = 0
    var availableTrunkVolume:Double {
        get {
            return trunkVolume - filledTrunkVolume
        }
    }
    var engine: engine {
        didSet {
            if self.engine == .start {
                print("Двигатель \(model) запущен")
            } else {
                print("Двигатель \(model) заглушен")
            }
        }
    }
    var windows: windows
    
    mutating func switchWindows() {
        if self.windows == .open {
            self.windows = .closed
        } else {
        self.windows = .open
        }
    }
    
    mutating func switchEngine() {
        if self.engine == .stop {
            self.engine = .start
        } else {
            self.engine = .stop
        }
    }
    
    mutating func loadTrunk(cargo: Double) {
        self.filledTrunkVolume += cargo
        if self.filledTrunkVolume > self.trunkVolume {
            self.filledTrunkVolume -= cargo
            print("Столько не влезет, можно загузить \(availableTrunkVolume)")
        }
    }

    mutating func unloadTrunk(cargo: Double) {
        self.filledTrunkVolume -= cargo
        if self.filledTrunkVolume < 0 {
            self.filledTrunkVolume += cargo
            print("Столько груза нет, доступно \(self.filledTrunkVolume)")
        }
    }
    
    func printAvalibleTrunkVolume() {
        print("Доступно \(availableTrunkVolume) литра(ов) объёма багажника")
    }
}

var car1 = Cars(model: "Ford Focus", year: 2008, trunkVolume: 300, filledTrunkVolume: 100, engine: .stop, windows: .open)
var car2 = Cars(model: "Honda Civic", year: 2020, trunkVolume: 150, filledTrunkVolume: 20, engine: .stop, windows: .closed)
var car3 = Cars(model: "Toyota Sprinter Carib", year: 1988, trunkVolume: 400, filledTrunkVolume: 0, engine: .stop, windows: .open)

car1.loadTrunk(cargo: 500)
car1.unloadTrunk(cargo: 50)
car2.unloadTrunk(cargo: 100)
car1.switchEngine()
car1.switchEngine()
car2.switchWindows()
print (car1)

car2.printAvalibleTrunkVolume()
