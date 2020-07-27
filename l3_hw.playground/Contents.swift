enum CarActions{
    case openDoor, closeDoor, openWindows, closeWindows, fillBody, unfillBody
}

struct SportCar{
    let brand : String // марка
    let year : Int // год выпуска
    let bodyVolume : Int // объем кузова
    var isDoorOpen : Bool = false// открыты ли двери
    var isWindowsOpen : Bool = false// открыты ли окна
    var filledCapacity : Int = 0 // заполненный объем багажника
    init?(brand : String, year : Int, bodyVolume : Int){
        guard (brand != "" && year > 0 && bodyVolume > 0) else {
            return nil
        }// Проверяем если все нормально, то присваиваем значения
        self.brand = brand
        self.year = year
        self.bodyVolume = bodyVolume
    }
    mutating func action(typeOf : CarActions, _ volume : Int...){
        switch typeOf {
        case .openDoor:
            self.isDoorOpen = true
        case .closeDoor:
            self.isDoorOpen = false
        case .openWindows:
            self.isWindowsOpen = true
        case .closeWindows:
            self.isWindowsOpen = false
        case .fillBody:
            if (self.filledCapacity + volume[0]  <= bodyVolume){
                self.filledCapacity += volume[0]
            }
            else{
                print("Overflow")
            }
        case .unfillBody:
            if(self.filledCapacity - volume[0] >= 0){
                self.filledCapacity -= volume[0]
            }
            else{
                print("Too many")
            }
            
        default:
            print("Not enought information")
        }
    }
}

struct TrunkCar{
    let brand : String // марка
    let year : Int // год выпуска
    let bodyVolume : Int // объем кузова
    var isDoorOpen : Bool // открыты ли двери
    var isWindowsOpen : Bool // открыты ли окна
    var filledCapacity : Int // заполненный объем багажника
    mutating func action(typeOf : CarActions, _ volume : Int...){
           switch typeOf {
           case .openDoor:
               self.isDoorOpen = true
           case .closeDoor:
               self.isDoorOpen = false
           case .openWindows:
               self.isWindowsOpen = true
           case .closeWindows:
               self.isWindowsOpen = false
           case .fillBody:
               if (self.filledCapacity + volume[0]  <= bodyVolume){
                   self.filledCapacity += volume[0]
               }
               else{
                   print("Overflow")
               }
           case .unfillBody:
               if(self.filledCapacity - volume[0] >= 0){
                   self.filledCapacity -= volume[0]
               }
               else{
                   print("Too many")
               }
               
           default:
               print("Not enought information")
           }
       }
}
var car = SportCar(brand: "Toyota", year: 1999, bodyVolume: 300)!
car.action(typeOf: .closeDoor)
car.action(typeOf: .fillBody, 100)
print(car.filledCapacity)
car.action(typeOf: .fillBody, 300)
