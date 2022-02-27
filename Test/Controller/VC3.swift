//
//  VC3.swift
//  Test
//
//  Created by Kunal's MacBook on 23/01/22.
//

import UIKit


struct stack<Ele> {
    var items: [Ele] = []
    
    mutating func pushItem(_ item: Ele){
        items.append(item)
    }
    
    mutating func popItem() {
        items.removeLast()
    }
}

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}


class VC3: UIViewController {
    
    var myStack = stack<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smallTriangle = Triangle(size: 3)
        print(smallTriangle.draw())
        
//        myStack.pushItem(10)
//        myStack.pushItem(20)
//        myStack.pushItem(30)
//        print(myStack.items)
//        myStack.popItem()
//        print(myStack.items)

//        var a = 10, b = 20
//
//        print("A-----",a,"B-------",b)
//        swapTwoNumber(&a, &b)
//
//        print("A-----",a,"B-------",b)
        
    }
    
    func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    func swapTwoNumber<T>(_ a: inout T,_ b: inout T){
        let temp = a
        a = b
        b = temp
    }
}

