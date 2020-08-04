//
//  main.swift
//  queue
//
//  Created by Dmitry on 03.08.2020.
//  Copyright © 2020 g4play. All rights reserved.
//

import Foundation
import Cocoa


class Queue<T>{
    private var elements : Array<T> = []
    
    init() {
        elements = []
    }
    func top() -> T?{
        return elements.last;
    }
    func push(_ elem : T){
        elements = [elem] + elements
    }
    func pop() -> T{
        return elements.removeLast()
    }
    subscript(index: Int ) -> T? {  // доступ к стеку по индексу
        return elements[index]
    }
    subscript(indices : UInt ...) -> [T?]{
        var elems : Array<T?> = []
        for (i, _) in elements.enumerated() where indices.contains(UInt(i)){
            elems.append(elements[i])
            
        }
        return elems
    }
    func filter(array: Queue<Any>, predicate: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()               // создает временный массив
        for element in array.elements {
            if predicate(element as! T) {         // вызываем замыкание, чтобы проверить элемент
                tmpArray.append(element as! T)
            }
        }
        return tmpArray                     // возвращаем отфильтрованный массив
    }
}


var a : Queue<Int> = Queue<Int>()
a.push(1)
a.push(2)
print(a.pop())
print(a.pop())
