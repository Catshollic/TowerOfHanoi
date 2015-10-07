//: Playground - noun: a place where people can play

import UIKit

class Monster{
    var level:Int
    var name:String
    
        //イニシャライザ
    init(name:String,level:Int = 1){
        self.name = name
        self.level = level
    }
    
    func description()->String{
        return "\(name) Lv.\(level)"
    }
}

let slimeA = Monster(name:"スライム")
let slimeB = Monster(name:"スライム",level:5)

println(slimeA.description())
println(slimeB.description())

