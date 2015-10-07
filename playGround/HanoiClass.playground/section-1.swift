// Playground - noun: a place where people can play

import UIKit

//btnを押したらその数を配列に代入する

var NUM = 5
class Hanoi {
    var ary:[Int] = Array(count:NUM,repeatedValue:0)
}

var tower1 = Hanoi()
var tower2 = Hanoi()
var tower3 = Hanoi()
for i in 0..<NUM{
    tower1.ary[i] = i
    println(tower1.ary[i])
}
println(tower1.ary)


class HanoiSystem{
    //
}
