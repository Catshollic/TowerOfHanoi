//: Playground - noun: a place where people can play

import UIKit

/* モンスタークラス */
class Monster {
    var level = 1       // レベル
    var name: String?   // 名前
    // 説明
    func description() -> String {
        if name == nil  {
            return "不明 Lv.\(level)"
        } else {
            return "\(name!) Lv.\(level)"
        }
    }
}

var monsterA = Monster()
println(monsterA.description())

var slime = Monster()
slime.name = "スライム"
println(slime.description())

var monsterA = Monster()
monsterA.name = "スライム"

var monsterB = monsterA
monsterB.name = "ドラゴン"

