//: Playground - noun: a place where people can play

import UIKit

class Monster {
    let name:String
    var maxHp:Int = 0
    var hp:Int = 0
    
    var level:Int{
        get{
            return max(1,Int(sqrt(Float(maxHp - 10))))
        }
        set(lv){//getterで取ったものを()内の変数に受け取らせる
            maxHp = 10 + lv * lv
        }
    }
    
    init(name:String,level:Int = 1){
        self.name = name
        self.level = level
        self.hp = self.maxHp
    }

    func descripiton()->String{
        return "\(name) Lv.\(level) HP\(hp)/\(maxHp)"
    }
}

let goblin = Monster(name: "ゴブリン", level: 10)
println(goblin.descripiton())
goblin.level = 20
println(goblin.descripiton())
