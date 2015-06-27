//
//  ViewController.swift
//  tajuuhairetu2
//
//  Created by 4ut0 on 2015/06/26.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var btn1:UIButton!
    private var btn2:UIButton!
    private var btn3:UIButton!
    var pushBtn1:Bool! = false
    var pushBtn2:Bool! = false
    var pushBtn3:Bool! = false
    var ary:[[Int]] = [[1,0,0]
                      ,[2,0,0]
                      ,[3,0,0]]
    var count:Int = 1
    let left:Int! = 0
    let center:Int! = 1
    let right:Int! = 2
    let blockNum:Int! = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn()
        printAry()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func printAry(){
        for i in 0...2 {
            for j in 0...2 {
                print("\(ary[i][j])")
            }
            println()
            
        }
        println("-----------------------------")
    }
    
    internal func btn1(sender:UIButton){
        btn1Action()
        setTitleBtn()
        checkPushBtns()
    }
    internal func btn2(sender:UIButton){
        btn2Action()
        setTitleBtn()
        checkPushBtns()
    }
    internal func btn3(sender:UIButton){
        btn3Action()
        setTitleBtn()
        checkPushBtns()
    }

    func btn1Action(){
        if pushBtn1 == false && pushBtn2 == false && pushBtn3 == false{
            //全てのボタンの値がfalseの場合,ボタン1の値をtrueに
            pushBtn1 = true
        }else if pushBtn1 == true && pushBtn2 == false && pushBtn3 == false{
            //そうでなくボタン1が押されていた場合,元に戻す
            pushBtn1 = false
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            //そうでなくてボタン2が押されていた場合,左に描画して元に戻す
            //FTF -> 2 -> 1
            pushBtn2 = false
            searchCenterValue()
            digLeft()
            checkLeftValue()
            moveCenterLeft()
            
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            //そうでなくてボタン3が押されていた場合,右に描画して元に戻す
            //FFT ->  3 -> 1に
            pushBtn3 = false
            searchRightValue()
            digLeft()
            checkLeftValue()
            moveRightLeft()
        }else{//それ意外だった場合初期化する
            allBtnReset()
        }
        
    }
    func btn2Action(){
        
        if pushBtn1 == false && pushBtn2 == false && pushBtn3 == false{
            //FFF -> ボタン2の値をtrueに
            pushBtn2 = true
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            //FTF -> 元に戻す
            pushBtn2 = false
            
        }else if pushBtn1 == true && pushBtn2 == false && pushBtn3 == false{
            //TFF -> 1 -> 2 に
            pushBtn1 = false
            searchLeftValue()
            digCenter()
            checkCenterValue()
            moveLeftCenter()
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            pushBtn3 = false
            //FFT ->  3 -> 2に
            searchRightValue()
            digCenter()
            checkCenterValue()
            moveRightCenter()
        }else{
            allBtnReset()
        }
    }
    func btn3Action(){
        if pushBtn1 == false && pushBtn2 == false && pushBtn3 == false{
            //全てのボタンの値がfalseの場合,ボタン3の値をtrueに
            pushBtn3 = true
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            //そうでなくボタン3が押されていた場合,元に戻す
            pushBtn3 = false
        }else if pushBtn1 == true && pushBtn2 == false && pushBtn3 == false{
            //そうでなくてボタン1が押されていた場合,真ん中に描画して元に戻す
            // TFF  1 -> 3
            pushBtn1 = false
            searchLeftValue()
            digRight()
            checkRightValue()
            moveLeftRight()
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            pushBtn2 = false
            //そうでなくてボタン2が押されていた場合,真ん中に描画して元に戻す
            //FTF 2 -> 3
            searchCenterValue()
            digRight()
            checkRightValue()
            moveCenterRight()
        }else{
            allBtnReset()
        }
    }
    
    //check func
    func checkPushBtns(){
//        print(" pushBtn1 == \(pushBtn1)")
//        print(" pushBtn2 ==\(pushBtn2)")
//        print(" pushBtn3 ==\(pushBtn3)")
//        println()
//        
    }
    
    func searchLeftValue()->Int{//0であれば次の配列にいく
        var i:Int = 0
        var search:Int! = blockNum
        var cantCount:Int = 0
        while search == 3{
            if (ary[i][left] != 0) {
                search = i
                //println("[\(search)][left]は\(ary[i][left]) can move")
                println("動かす値の場所は[\(search)][left]")
            }else{
                i++
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search

    }//左の柱にオブジェクトがあったらその値を返す
    func searchCenterValue()->Int{//0であれば次の配列にいく
        var i:Int = 0
        var search:Int! = blockNum
        var cantCount:Int = 0
        while search == 3{
            if (ary[i][center] != 0) {
                search = i
                //println("[\(search)][center]は\(ary[i][center]) can move")
                println("動かす値の場所は[\(search)][center]")
            }else{
                i++
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search
        
    }//真ん中の柱にオブジェクトがあったらその値を返す
    func searchRightValue()->Int{//0であれば次の配列にいく
        var i:Int = 0
        var search:Int! = blockNum
        var cantCount:Int = 0
        while search == 3{
            if (ary[i][right] != 0) {
                search = i
                //println("[\(search)][right]は\(ary[i][right]) can move")
                println("動かす値の場所は[\(search)][right]")
            }else{
                i++
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search
        
    }//左の柱にオブジェクトがあったらその値を返す

    func checkCenterValue(){
        var i:Int = 0
        while(blockNum != i){
            //println("\(i+1)列目 = \(ary[i][center]) ")
            i++
        }
        
    }//真ん中の柱に何があるかをチェックする
    func checkLeftValue(){
        var i:Int = 0
        while(blockNum != i){
            //println("\(i+1)列目 = \(ary[i][left]) ")
            i++
        }
    }//左の柱に何があるかをチェックする
    func checkRightValue(){
        var i:Int = 0
        while(blockNum != i){
            println("\(i+1)列目 = \(ary[i][right]) ")
            i++
        }//右の柱に何があるかをチェックする
    }//右の柱に何があるかをチェックする
    
    func digCenter()->Int{ //左を下から掘って0(格納できる場所)の値があればその配列の値を（search)返す,searchがblockNumであるのあらば移動できない
        var i:Int = blockNum-1
        var search:Int! = -1
        var cantCount:Int = 0
        
        while search == -1{
            if (ary[i][center] == 0) {
                search = i
                //println("[\(search)][center]は\(ary[i][center]) can move")
                println("格納できる場所は[\(search)][center]")
            }else{
                i--
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search
    }
    
    func digLeft()->Int{ //左を下から掘って0の値があればその配列の値を返す
        var i:Int = blockNum-1
        var search:Int! = -1
        var cantCount:Int = 0
        
        while search == -1{
            if (ary[i][left] == 0) {
                search = i
                //println("[\(search)][left]は\(ary[i][left]) can move")
                println("格納できる場所は[\(search)][left]")
            }else{
                i--
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search
    }

    func digRight()->Int{ //左を下から掘って0の値があればその配列の値を返す
        var i:Int = blockNum-1
        var search:Int! = 0
        var cantCount:Int = 0
        
        while search == -1{
            if (ary[i][right] == 0) {
                search = i
                //println("[\(search)][right]は\(ary[i][right]) can move")
                println("格納できる場所は[\(search)][right]")
            }else{
                i--
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
                if cantCount == blockNum{
                    search = blockNum
                    println("\(search)なので移動できない")
                }
            }
        }
        return search
    }

    //move
    func moveLeftCenter(){ //左から真ん中へ動かす関数
        ary[digCenter()][center] = ary[searchLeftValue()][left]
        ary[searchLeftValue()][left] = 0
        printAry()
    }
    func moveLeftRight(){ //左から右に動かす関数
        ary[digRight()][right] = ary[searchLeftValue()][left]
        ary[searchLeftValue()][left] = 0
        printAry()
    }
    func moveCenterLeft(){ //真ん中から左へ動かす関数
        ary[digLeft()][left] = ary[searchCenterValue()][center]
        ary[searchCenterValue()][center] = 0
        printAry()
        }
    func moveCenterRight(){ //真ん中から右に動かす関数
        ary[digRight()][right] = ary[searchCenterValue()][center]
        ary[searchCenterValue()][center] = 0
        printAry()
    }
    func moveRightLeft(){ //右から左に動かす関数
        ary[digLeft()][left] = ary[searchRightValue()][right]
        ary[searchRightValue()][right] = 0
        printAry()
    }
    func moveRightCenter(){ //右から真ん中に動かす関数
        ary[digCenter()][center] = ary[searchRightValue()][right]
        ary[searchRightValue()][right] = 0
        printAry()
    }
    



    func setTitleBtn(){
        if pushBtn1 == true{
            btn1.setTitle("Where", forState: UIControlState.Normal)
        }else{
            btn1.setTitle("btn1", forState: UIControlState.Normal)
        }
        
        if pushBtn2 == true{
            btn2.setTitle("Where", forState: UIControlState.Normal)
        }else{
            btn2.setTitle("btn2", forState: UIControlState.Normal)
        }
        
        if pushBtn3 == true{
            btn3.setTitle("Where", forState: UIControlState.Normal)
        }else{
            btn3.setTitle("btn3", forState: UIControlState.Normal)
        }
        
    }
    //
    //btnAllReset
    func allBtnReset(){
        pushBtn1 = false
        pushBtn2 = false
        pushBtn3 = false
    }
    
    
    func createBtn()->String{
        //button1を生成
        btn1 = UIButton()//button作成
        btn1.tag = 1//buttonのtag設定
        btn1.frame = CGRectMake(40,30,140,250)//buttonの場所
        btn1.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:0.1)//buttonの背景
        btn1.layer.masksToBounds = true
        btn1.setTitle("btn1", forState: UIControlState.Normal)
        btn1.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        btn1.addTarget(self, action:"btn1:",forControlEvents: .TouchUpInside)///buttonに機能btn1をTouchUpInsideされた時に行う
        self.view.addSubview(btn1)
        
        //button2を生成
        btn2 = UIButton()
        btn2.tag = 2
        btn2.frame = CGRectMake(230,30,140,250)
        btn2.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:0.1)
        btn2.layer.masksToBounds = true
        btn2.setTitle("btn2",forState:UIControlState.Normal)
        btn2.setTitleColor(UIColor.blueColor(),forState: UIControlState.Normal)
        btn2.addTarget(self, action:"btn2:",forControlEvents: .TouchUpInside)//buttonに機能btn2をTouchUpInsideされた時に行う
        self.view.addSubview(btn2)
        
        //button3を生成
        btn3 = UIButton()
        btn3.tag = 3
        btn3.frame = CGRectMake(380,30,140,250)
        btn3.backgroundColor = UIColor(red:0.0,green:0.0,blue:1.0,alpha:0.1)
        btn3.layer.masksToBounds = true
        btn3.setTitle("btn3",forState:UIControlState.Normal)
        btn3.setTitleColor(UIColor.redColor(),forState: UIControlState.Normal)
        btn3.addTarget(self, action:"btn3:",forControlEvents: .TouchUpInside)//buttonに機能btn3をTouchUpInsideされた時に行う
        self.view.addSubview(btn3)
        
        return ("Button set.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

