//: Playground - noun: a place where people can play

import UIKit

class Monster{
    var level = 1
    let name:String

    init(){
        self.name = "不明"
    }
    
    func description()->String{
        return "\(name) Lv.\(level)"
    }
}

let m = Monster()
println(m.description())
