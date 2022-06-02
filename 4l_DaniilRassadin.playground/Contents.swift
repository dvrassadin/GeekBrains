import UIKit

class Cars {
    enum engine: String {
        case start = "запущен"
        case stop = "остановлен"
    }

    enum windows: String {
        case open = "открыты"
        case closed = "закрыты"
    }
  
    let model: String
    let color: UIColor
    let trunkVolume: Double
    var filledTrunkVolume: Double = 0
    var availableTrunkVolume: Double {
        get {
            return trunkVolume - filledTrunkVolume
        }
    }
    var engine: engine
    var windows: windows = .closed
    
    func switchWindows(windowsStatus: windows) {
        if self.windows == .open && windowsStatus == .open {
            print("Окна уже открыты")
        } else if self.windows == .closed && windowsStatus == .closed {
            print("Окна уже закрыты")
        } else {
            self.windows = windowsStatus
        }
    }
    
    func switchEngine(engineStatus: engine) {
        if self.engine == .start && engineStatus == .start {
            print("Двитатель уже запущен")
        } else if self.engine == .stop && engineStatus == .stop {
            print("Двигатель уже остановлен")
        } else {
            self.engine = engineStatus
        }
    }
    
    func loadTrunk(cargo: Double) {
        self.filledTrunkVolume += cargo
        if self.filledTrunkVolume > self.trunkVolume {
            self.filledTrunkVolume -= cargo
            print("Столько не влезет, можно загузить \(availableTrunkVolume)")
        }
    }

    func unloadTrunk(cargo: Double) {
        self.filledTrunkVolume -= cargo
        if self.filledTrunkVolume < 0 {
            self.filledTrunkVolume += cargo
            print("Столько груза нет, доступно \(self.filledTrunkVolume)")
        }
    }
    
    func printAvalibleTrunkVolume() {
        print("Доступно \(availableTrunkVolume) литра(ов) объёма багажника")
    }
    
    func printCar () {
        print("\(model), двигатель \(self.engine.rawValue), окна \(self.windows.rawValue), багажник заполнен на \(filledTrunkVolume) из \(trunkVolume)")
    }
    
    init (model: String, color: UIColor, trunkVolume: Double, filledTrunkVolume: Double, engine: engine, windows: windows) {
        self.model = model
        self.color = color
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.engine = engine
        self.windows = windows
    }
        
}

class TrunkCars: Cars {
    let vehicleWeight: Double
    var grossVehicleWeight: Double { //вес автомобиль с грузом
        get {
            return vehicleWeight + filledTrunkVolume
        }
    }
    let maxVehicleWeight: Double = 5000 //допустим — это максимальный разрешённый законом полный вес автомобиля
    
    override func loadTrunk(cargo: Double) {
        self.filledTrunkVolume += cargo
        if self.filledTrunkVolume > self.trunkVolume {
            self.filledTrunkVolume -= cargo
            print("Столько не влезет, можно загузить \(availableTrunkVolume)")
        } else if self.grossVehicleWeight > maxVehicleWeight {
            self.filledTrunkVolume -= cargo
            print("Полный вес автомобиль не должен превышать \(maxVehicleWeight)") //при загрузке автомобиля, в отличии от оригинальной функции, дополнительно проверяется чтобы его полный вес не превышал максимальный
        }
    }
    
    init (model: String, color: UIColor, trunkVolume: Double, filledTrunkVolume: Double, engine: engine, windows: windows, vehicleWeight: Double) {
        self.vehicleWeight = vehicleWeight
        super.init(model: model, color: color, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, engine: engine, windows: windows)
    }
}

class SportCar: Cars {
    enum EngineType: String {
        case IC = "внутреннего сгорания"
        case electrical = "электрический"
    }
    
    let engineType: EngineType
    let maxSpeed: Double
    
    override func printCar() {
        print("\(model), цвет \(self.color), двигатель \(self.engineType.rawValue), максимальная скорость \(maxSpeed)")
    }
    
    override func switchEngine(engineStatus: Cars.engine) {
        switch engineStatus {
        case .start where engineType == .electrical:
            self.engine = .start
            print("Автомобиль готов к поездке")
        case .stop where engineType == .electrical:
            self.engine = .stop
        case .start where engineType == .IC && self.engine == .start:
            print("Двигатель уже запущен")
        case .start where engineType == .IC && self.engine == .stop:
            self.engine = .start
            print("Двигатель запущен")
        case .stop where engineType == .IC && self.engine == .stop:
            print("Двигатель уже остановлен")
        case .stop where engineType == .IC && self.engine == .start:
            self.engine = .start
            print("Двигатель остановлен")
        default:
            break
        }
    }
    
    init(model: String, color: UIColor, trunkVolume: Double, filledTrunkVolume: Double, engine: Cars.engine, windows: Cars.windows, engineType: EngineType, maxSpeed: Double) {
        self.engineType = engineType
        self.maxSpeed = maxSpeed
        super.init(model: model, color: color, trunkVolume: trunkVolume, filledTrunkVolume: filledTrunkVolume, engine: engine, windows: windows)
    }
}

var car1 = Cars(model: "Ford Focus", color: .brown, trunkVolume: 300, filledTrunkVolume: 20, engine: .stop, windows: .closed)

car1.printCar()

var trunkCar1 = TrunkCars(model: "Man", color: .blue, trunkVolume: 4500, filledTrunkVolume: 0, engine: .stop, windows: .closed, vehicleWeight: 1000)

trunkCar1.loadTrunk(cargo: 4100)
trunkCar1.loadTrunk(cargo: 3000)
trunkCar1.printCar()

var sportCar1 = SportCar(model: "Audi R8", color: .black, trunkVolume: 200, filledTrunkVolume: 0, engine: .start, windows: .closed, engineType: .IC, maxSpeed: 300)
var sportCar2 = SportCar(model: "Tesla Model S", color: .green, trunkVolume: 400, filledTrunkVolume: 120, engine: .stop, windows: .closed, engineType: .electrical, maxSpeed: 320)

sportCar1.printCar()
sportCar1.switchEngine(engineStatus: .start)
sportCar2.switchEngine(engineStatus: .start)
sportCar2.printCar()
