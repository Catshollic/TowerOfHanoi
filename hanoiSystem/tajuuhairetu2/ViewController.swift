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
            checkLeftValue()
            moveCenterLeft()
            
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            //そうでなくてボタン3が押されていた場合,右に描画して元に戻す
            //FFT ->  3 -> 1に
            pushBtn3 = false
            searchRightValue()
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
            checkCenterValue()
            moveLeftCenter()
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            pushBtn3 = false
            //FFT ->  3 -> 2に
            searchRightValue()
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
            checkRightValue()
            moveLeftRight()
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            pushBtn2 = false
            //そうでなくてボタン2が押されていた場合,真ん中に描画して元に戻す
            //FTF 2 -> 3
            searchCenterValue()
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
    
    func searchLeftValue(var i:Int = 0,var search:Int = 0)->Int{//0であれば次の配列にいく
        for i in 0..<blockNum{
            if (ary[i][left] != 0) {
               search = i
            }
        }
        return search
    }//左の柱にオブジェクトがあったらその値を返す
    func searchCenterValue(var i:Int = 0,var search:Int = 0)->Int{//0であれば次の配列にいく
        for i in 0..<blockNum{
            if (ary[i][center] != 0) {
                search = i
            }
        }
        return search
    }//真ん中の柱にオブジェクトがあったらその値を返す
    func searchRightValue(var i:Int = 0,var search:Int = 0)->Int{//0であれば次の配列にいく
        for i in 0..<blockNum{
            if (ary[i][right] != 0) {
                search = i
            }
        }
        return search
    }//左の柱にオブジェクトがあったらその値を返す

    func checkCenterValue(var i:Int = 0){
        while(blockNum != i){
            //println("\(i+1)列目 = \(ary[i][center]) ")
            i++
        }
        
    }//真ん中の柱に何があるかをチェックする
    func checkLeftValue(var i:Int = 0){
        while(blockNum != i){
            println("\(i+1)列目 = \(ary[i][left]) ")
            i++
        }
    }//左の柱に何があるかをチェックする
    func checkRightValue(var i:Int = 0){
        while(blockNum != i){
            println("\(i+1)列目 = \(ary[i][right]) ")
            i++
        }//右の柱に何があるかをチェックする
    }//右の柱に何があるかをチェックする
    
    func digLeft(var i:Int = 0,var search:Int = 0)->Int{ //左を下から掘って0の値があればその配列の値を返す
        for(i = 3; i<blockNum; i--){
            if (ary[i][left] == 0) {
                search = i
            }
        }
        return search
    }
    
    func setcolor(color: UIColor!)->UILabel!{
        var tmpLabel: UILabel = UILabel(frame: CGRectMake(10,10,10,10))
        tmpLabel.backgroundColor = color
        return tmpLabel
        
    }

    //move
    func moveLeftCenter(){ //左から真ん中へ動かす関数
        if ary[blockNum-1][center] == 0 { //真ん中の一番下になにもなければ
            ary[blockNum-1][center] = ary[searchLeftValue()][left] //真ん中の一番下に左の最上のブロックを代入
            ary[searchLeftValue()][left] = 0 //左の最上の値を0に
        }else{
            
        }
        printAry()
    }
    func moveLeftRight(){ //左から右に動かす関数
        if ary[blockNum-1][right] == 0 { //右の一番下に何もなければ
            ary[blockNum-1][right] = ary[searchLeftValue()][left] //右の一番下に左の最上のブロックを代入
            ary[searchLeftValue()][left] = 0 //左の最上の値を0に
        }
        printAry()
    }
    func moveCenterLeft(){ //真ん中から左へ動かす関数
        if ary[digLeft()][left] == 0 { //左の一番下に何もなければ
        ary[digLeft()][left] = ary[searchCenterValue()][center] //左の一番下に真ん中の最上ブロックを代入
        ary[searchCenterValue()][center] = 0 //真ん中の最上の値を0に
        }
    printAry()
    }
    func moveCenterRight(){ //真ん中から右に動かす関数
        if ary[blockNum-1][right] == 0 { //右の一番下に何もなければ
            ary[blockNum-1][right] = ary[searchCenterValue()][center] //右の一番下に真ん中の最上ブロックを代入
            ary[searchCenterValue()][center] = 0 //真ん中の最上の値を0に
        }
        printAry()
    }
    func moveRightLeft(){ //右から左に動かす関数
        if ary[blockNum-1][left] == 0 { //左の一番下になにもなければ
            ary[blockNum-1][left] = ary[searchRightValue()][right] //左の一番下に右の最上をブロックを代入
            ary[searchRightValue()][right] = 0 //右の最上の値を0に
        }
        printAry()
    }
    func moveRightCenter(){ //右から真ん中に動かす関数
        if ary[blockNum-1][center] == 0 { //真ん中の一番下が何もなければ
            ary[blockNum-1][center] = ary[searchRightValue()][right] //真ん中の一番下に右の最上ブロックを代入
            ary[searchRightValue()][right] = 0 //右の最上の値を0に
        }
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
        btn1.frame = CGRectMake(80,30,100,30)//buttonの場所
        btn1.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)//buttonの背景
        btn1.layer.masksToBounds = true
        btn1.setTitle("btn1", forState: UIControlState.Normal)
        btn1.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        btn1.addTarget(self, action:"btn1:",forControlEvents: .TouchUpInside)///buttonに機能btn1をTouchUpInsideされた時に行う
        self.view.addSubview(btn1)
        
        //button2を生成
        btn2 = UIButton()
        btn2.tag = 2
        btn2.frame = CGRectMake(280,30,100,30)
        btn2.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:1.0)
        btn2.layer.masksToBounds = true
        btn2.setTitle("btn2",forState:UIControlState.Normal)
        btn2.setTitleColor(UIColor.blueColor(),forState: UIControlState.Normal)
        btn2.addTarget(self, action:"btn2:",forControlEvents: .TouchUpInside)//buttonに機能btn2をTouchUpInsideされた時に行う
        self.view.addSubview(btn2)
        
        //button3を生成
        btn3 = UIButton()
        btn3.tag = 3
        btn3.frame = CGRectMake(480,30,100,30)
        btn3.backgroundColor = UIColor(red:0.0,green:0.0,blue:1.0,alpha:1.0)
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

