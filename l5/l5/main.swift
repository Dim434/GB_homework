//
//  main.swift
//  l5
//
//  Created by Dmitry on 29.07.2020.
//  Copyright © 2020 g4play. All rights reserved.
//

import Foundation
import Cocoa
enum CarActions{
    case openDoor, closeDoor, openWindows, closeWindows, fillBody, unfillBody, addNitro, attachCargo, detachCargo, fillCargo, unfillCargo
}

protocol Car{
    var brand : String {get}
    var year : Int {get}
    var bodyVolume : Int {get}
    var isDoorOpen : Bool {get set}
    var isEngineOn : Bool {get set}
    var isWindowsOpen : Bool {get set}
    var filledCapacity : Int {get set}
    func makeAction(param : CarActions, _ volume : Int...)
}
extension Car{
    mutating func openDoor(){
        if self.isDoorOpen {
            print("Уже открыто")
        }
        else{
            self.isDoorOpen = true
            print("Открыто")
        }
    }
    mutating func closeDoor(){
        if !self.isDoorOpen{
            print("Уже закрыто")
        }
        else{
            self.isDoorOpen = false
            print("Закрыто")
        }
    }
    mutating func turnOnEngine(){
        if self.isEngineOn {
            print("Уже включено")
        }
        else{
            self.isEngineOn = true
            print("Включено")
        }
    }
    mutating func turnOffEngine(){
        if !self.isEngineOn{
            print("Уже выключено")
        }
        else{
            self.isEngineOn = false
            print("Выключено")
        }
    }
    mutating func openWindows(){
        if self.isWindowsOpen {
            print("Уже открыто")
        }
        else{
            self.isWindowsOpen = true
            print("Открыто")
        }
    }
    mutating func closeWindows(){
        if !self.isWindowsOpen{
            print("Уже закрыто")
        }
        else{
            self.isWindowsOpen = false
            print("Закрыто")
        }
    }
}

class SportCar : Car, CustomStringConvertible{
    public let brand: String
    
    public let year: Int
    
    public let bodyVolume: Int
    
    public var isDoorOpen: Bool = false
    
    public var isEngineOn: Bool = false
    
    public var isWindowsOpen: Bool = false
    
    public var filledCapacity: Int = 0
    public var maxAcceleration : Double = 2
    
    func makeAction(param : CarActions, _ volume : Int...){
        switch param {
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
        case .addNitro:
            self.maxAcceleration += 2
        default:
            print("Not enought information")
        }
        
    }
    
    init?(brand : String, year : Int, bodyVolume : Int){
        guard (brand != "" && year > 0 && bodyVolume > 0) else {
            return nil
        }// Проверяем если все нормально, то присваиваем значения
        self.brand = brand
        self.year = year
        self.bodyVolume = bodyVolume
        
    }
    var description: String {
        return "Sport car(\(self.brand), \(self.year))"
    }
}

class TrunkCar : Car, CustomStringConvertible{

    
    public let brand : String // марка
    public let year : Int // год выпуска
    public let bodyVolume : Int // объем кузова
    public var isDoorOpen : Bool // открыты ли двери
    public var isWindowsOpen : Bool // открыты ли окна
    public var filledCapacity : Int // заполненный объем багажника\
    public var isEngineOn: Bool = false
    public var isCargoAttached : Bool = true
    public var cargoMax : Int = 0
    public var currentCargo : Int = 0
    var description: String {
        return "Trunk car(\(self.brand), \(self.year))"
    }
    init?(brand : String, year : Int, bodyVolume : Int){
        guard (brand != "" && year > 0 && bodyVolume > 0) else {
            return nil
        }// Проверяем если все нормально, то присваиваем значения
        self.brand = brand
        self.year = year
        self.isDoorOpen = false
        self.isWindowsOpen = false
        self.filledCapacity = 0
        self.bodyVolume = bodyVolume
        self.isCargoAttached = false
        self.cargoMax = 0
        self.currentCargo = 0
    }
    func makeAction(param: CarActions, _ volume: Int...) {
        switch param {
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
        case .attachCargo:
            if !self.isCargoAttached{
                self.isCargoAttached = true
                self.cargoMax = volume[0]
                self.currentCargo = 0
            }
            else{
                print("already attached")
            }
            
        case .detachCargo:
            if self.isCargoAttached{
                self.isCargoAttached = false
                self.cargoMax = 0
                self.currentCargo = 0
            }
        case .fillCargo:
            if(self.currentCargo + volume[0] <= self.cargoMax){
                self.currentCargo += volume[0]
            }
            else{
                print("Too many")
            }
        case .unfillCargo:
            if(self.currentCargo - volume[0] >= 0){
                self.currentCargo -= volume[0]
            }
            else{
                print("Too many")
            }
            
        default:
            print("Not enought information")
        }
    }
}

var sport = SportCar(brand: "Toyota", year: 2000, bodyVolume: 200)!
var trunk = TrunkCar(brand: "Fiat", year: 2010, bodyVolume: 1000)!
sport.openDoor()
trunk.openDoor()
print(sport)
print(trunk)
