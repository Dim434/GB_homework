//
//  main.swift
//  L1_DmitryPotemin
//
//  Created by Dmitry on 13.07.2020.
//

import Foundation
//quadratic equation
var a,b,c :Double
a=1
b=2
c=1
var D : Double = Double(b*b - 4 * a * c)
if D > 0 {
    print((-b + sqrt(D))/(2*a))
    print((-b - sqrt(D))/(2*a))
}
else if D == 0{
    print(-b/(2*a))
}
else{
    print("No solve")
}
//Прямоугольный треугольник
var aa, bb : Double
aa = 3
bb = 4
if aa + bb > sqrt(aa*aa + bb*bb){
    print(aa*bb)
    print((aa+bb)*2)
    print(sqrt(aa*aa + bb*bb))
    
}
else{
    print("Невозможно") 
}

//bank
var sum, percentage : Double
sum = 1000
percentage = 2
if sum > 0 && percentage > 0{
print(sum * pow(1 + percentage / 100, 5))
}
else{
    print("Невозможно")
}
