//
//  ViewController.swift
//  draw2
//
//  Created by 4ut0 on 2015/06/09.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {
    var myComposeView:SLComposeViewController!
    private var btn1: UIButton!
    private var btn2: UIButton!
    private var btn3: UIButton!
    private var resetBtn: UIButton!
    var btnCount:Int = 0
    var rectX:Int!
    var rectY:Int!
    let rect1num:[Int] = [105,305,505]
    let rect2num:[Int] = [80,280,480]
    let rect3num:[Int] = [55,255,455]
    let rectYnum:[Int] = [260,290,320]//[0][1][2]
    var rect1 = UIView()
    var rect2 = UIView()
    var rect3 = UIView()
    var cover = UIView()
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
    //
    var cnt:Float = 0
    var timeLbl:UILabel!
    var timer :NSTimer!
    //
    var moveCountLbl:UILabel!
    var moveCount:Int = 0
    //var digRightValue:Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAll()
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
    
    
    //moveRect

    func moveRect1(){
        rect1.frame = CGRectMake(CGFloat(rectX), CGFloat(rectY), 50, 30)//(105,260,50,30)
        rect1.backgroundColor = UIColor(red:0.0,green:0.0,blue:1.0,alpha:1.0)
        //self.view.addSubview(rect3)
        //rect1.removeFromSuperview()
        //rect1.tag = 1
        println(rectX)
        self.view.addSubview(rect1)
        addMoveCount()
        println("done moveRect1")
        }
    func moveRect2(){
        
        rect2.frame = CGRectMake(CGFloat(rectX), CGFloat(rectY), 100, 30)
        rect2.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:1.0)
        self.view.addSubview(rect2)
        //rect1.removeFromSuperview()
        //rect2.tag = 1
        println(rectX)
        self.view.addSubview(rect2)
        addMoveCount()
        println("done moveRect2")
    }
    func moveRect3(){
        
        rect3.frame = CGRectMake(CGFloat(rectX), CGFloat(rectY), 150, 30)
        rect3.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        self.view.addSubview(rect3)
        //rect3.removeFromSuperview()
        //rect3.tag = 1
        println(rectX)
        self.view.addSubview(rect3)
        addMoveCount()
        println("done moveRect3")
    }

    //btn func
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
            moveCenterLeft()
            
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            //そうでなくてボタン3が押されていた場合,右に描画して元に戻す
            //FFT ->  3 -> 1に
            pushBtn3 = false
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
            moveLeftCenter()
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            pushBtn3 = false
            //FFT ->  3 -> 2に
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
            moveLeftRight()
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            pushBtn2 = false
            //そうでなくてボタン2が押されていた場合,真ん中に描画して元に戻す
            //FTF 2 -> 3
            moveCenterRight()
        }else{
            allBtnReset()
        }
    }
    
    
    func searchLeftValue()->Int{//0であれば次の配列にいく
        var i:Int = 0
        var search:Int! = -1
        var cantCount:Int = 0
        while search == -1{
            if (ary[i][left] != 0) {
                search = i
                //println("[\(search)][left]は\(ary[i][left]) can move")
                println("動かす値の場所は[\(search)][left]")
            }else{
                i++
                println("can't move cantcount leftValue \(cantCount)")
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
        var search:Int! = -1
        var cantCount:Int = 0
        while search == -1{
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
        var search:Int! = -1
        var cantCount:Int = 0
        while search == -1{
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
    
    //dig func
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
                println("can't move cantcount center \(cantCount)")
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
        var search:Int! = -1
        var cantCount:Int = 0
        
        while search == -1{
            println(ary[i][right])
            if (ary[i][right] == 0) {
                //digRightValue = i
                search = i
                //println("[\(search)][right]は\(ary[i][right]) can move")
                println("格納できる場所は[\(search)][right]")
            }else{
                i--
                println("can't move cantcount \(cantCount)")
                cantCount++
                //描画しない処理をする
//                if cantCount == blockNum{
//                    search = blockNum
//                    println("\(search)なので移動できない")
//                }
            }
        }
        return search
    }
    
    //move func
    func moveLeftCenter(){ //左から真ん中へ動かす関数
        if digCenter() == blockNum-1{//もし真ん中の最底辺であれば
            moveLeftCenterRect()
            ary[digCenter()][center] = ary[searchLeftValue()][left]
            ary[searchLeftValue()][left] = 0
        }else if ary[digCenter()+1][center]>ary[searchLeftValue()][left]{
            moveLeftCenterRect()
            ary[digCenter()][center] = ary[searchLeftValue()][left]
            ary[searchLeftValue()][left] = 0
            
        }else{
            println("cannot move")
        }
        printAry()
        
    }
    func moveLeftRight(){ //左から右に動かす関数
        if digRight() == blockNum-1{
            moveLeftRightRect()
            ary[digRight()][right] = ary[searchLeftValue()][left]
            ary[searchLeftValue()][left] = 0
        }else if ary[digRight()+1][right]>ary[searchLeftValue()][left]{
            moveLeftRightRect()
            ary[digRight()][right] = ary[searchLeftValue()][left]
            ary[searchLeftValue()][left] = 0
        }else{
            println("cannot move")
        }
        printAry()
    }
    func moveCenterLeft(){ //真ん中から左へ動かす関数
        if digLeft() == blockNum-1{
            moveCenterLeftRect()
            ary[digLeft()][left] = ary[searchCenterValue()][center]
            ary[searchCenterValue()][center] = 0
        
        }else if ary[digLeft()+1][left]>ary[searchCenterValue()][center]{
            moveCenterLeftRect()
            ary[digLeft()][left] = ary[searchCenterValue()][center]
            ary[searchCenterValue()][center] = 0
            }else{
            println("cannot move")
        }
        printAry()
    }
    func moveCenterRight(){ //真ん中から右に動かす関数
        if digRight() == blockNum-1{
            moveCenterRightRect()
            ary[digRight()][right] = ary[searchCenterValue()][center]
            ary[searchCenterValue()][center] = 0
        }else if ary[digRight()+1][right]>ary[searchCenterValue()][center]{
            moveCenterRightRect()
            ary[digRight()][right] = ary[searchCenterValue()][center]
            ary[searchCenterValue()][center] = 0
        }else{
        
            println("cannot move")
            }
        printAry()
        
    }
    func moveRightLeft(){ //右から左に動かす関数
        if digLeft() == blockNum-1{
            moveRightLeftRect()
            ary[digLeft()][left] = ary[searchRightValue()][right]
            ary[searchRightValue()][right] = 0
        }else if ary[digLeft()+1][left]>ary[searchRightValue()][right]{
            moveRightLeftRect()
            ary[digLeft()][left] = ary[searchRightValue()][right]
            ary[searchRightValue()][right] = 0
        }else{
            println("cannot move")
        }
        printAry()
    }
    func moveRightCenter(){ //右から真ん中に動かす関数
        if digCenter() == blockNum-1{//真ん中が一番下なら
            moveRightCenterRect()
            ary[digCenter()][center] = ary[searchRightValue()][right]
            ary[searchRightValue()][right] = 0
            
        }else if ary[digCenter()+1][center]>ary[searchRightValue()][right]{
            moveRightCenterRect()
            ary[digCenter()][center] = ary[searchRightValue()][right]
            ary[searchRightValue()][right] = 0
        }else{
            println("cannot move")
        }
        printAry()
    }

    //let rect_Xnum:[[Int]] = [[55,255,455],[80,280,480],[100,300,500]]
    //let rect_Ynum:[Int] = [320,290,260]// ^ 320,290,260
    //moveRect
    func moveLeftCenterRect(){
        switch ary[searchLeftValue()][left]{
            case 1:
                rectX = rect1num[center]
                rectY = rectYnum[digCenter()]
                moveRect1()
            case 2:
                
                rectX = rect2num[center]
                rectY = rectYnum[digCenter()]
                moveRect2()
            case 3:
                rectX = rect3num[center]
                rectY = rectYnum[digCenter()]
                moveRect3()
            default:
                break
            }
    }
    func moveLeftRightRect(){//左から真ん中に四角を移動させる
        println(ary[searchLeftValue()][left])
        switch ary[searchLeftValue()][left]{//[0][center] == 1,[1][center] == 2,[2][center] == 3
        case 1:
            rectX = rect1num[right]
            rectY = rectYnum[digRight()]
            moveRect1()
        case 2:
            rectX = rect2num[right]
            rectY = rectYnum[digRight()]
            moveRect2()
        case 3:
            rectX = rect3num[right]
            rectY = rectYnum[digRight()]
            moveRect3()
        default:
            break
        }
    }
    func moveCenterLeftRect(){
        switch ary[searchCenterValue()][center]{
        case 1:
            rectX = rect1num[left]
            rectY = rectYnum[digLeft()]
            moveRect1()
        case 2:
            rectX = rect2num[left]
            rectY = rectYnum[digLeft()]
            moveRect2()
        case 3:
            rectX = rect3num[left]
            rectY = rectYnum[digLeft()]
            moveRect3()
        default:
            break
        }
    }
    func moveCenterRightRect(){
        switch ary[searchCenterValue()][center]{
        case 1:
            rectX = rect1num[right]
            rectY = rectYnum[digRight()]
            moveRect1()
        case 2:
            rectX = rect2num[right]
            rectY = rectYnum[digRight()]
            moveRect2()
        case 3:
            rectX = rect3num[right]
            rectY = rectYnum[digRight()]
            moveRect3()
        default:
            break
        }
    }
    func moveRightCenterRect(){
        switch ary[searchRightValue()][right]{
        case 1:
            rectX = rect1num[center]
            rectY = rectYnum[digCenter()]
            moveRect1()
        case 2:
            rectX = rect2num[center]
            rectY = rectYnum[digCenter()]
            moveRect2()
        case 3:
            rectX = rect3num[center]
            rectY = rectYnum[digCenter()]
            moveRect3()
        default:
            break
        }
    }
    func moveRightLeftRect(){
        switch ary[searchRightValue()][right]{
        case 1:
            rectX = rect1num[left]
            rectY = rectYnum[digLeft()]
            moveRect1()
        case 2:
            rectX = rect2num[left]
            rectY = rectYnum[digLeft()]
            moveRect2()
        case 3:
            rectX = rect3num[left]
            rectY = rectYnum[digLeft()]
            moveRect3()
        default:
            break
        }
    }
    
    //btnAllReset
    func allBtnReset(){
        pushBtn1 = false
        pushBtn2 = false
        pushBtn3 = false
    }
    
    //check func
    func checkPushBtns(){
        //        print(" pushBtn1 == \(pushBtn1)")
        //        print(" pushBtn2 ==\(pushBtn2)")
        //        print(" pushBtn3 ==\(pushBtn3)")
        //        println()
        //        
    }
    
    func printAry(){
        for i in 0...2 {
            for j in 0...2 {
                print("\(ary[i][j])")
            }
            println()
            
        }
        println("-----------------------------")
        if ary[0][center] == 1 && ary[1][center] == 2 && ary[2][center] == 3{
            println("good-bye world!")
            setCover()
            timer.invalidate()
            onPostToTwitter()
        }
        if ary[0][right] == 1 && ary[1][right] == 2 && ary[2][right] == 3{
            println("good-bye world!")
            setCover()
            timer.invalidate()
            onPostToTwitter()
        }
        
    }
    func setCover(){
    
        self.view.addSubview(cover)
        cover.frame = CGRectMake(0,30,700, 500)
        cover.backgroundColor = UIColor(red:0.1,green:0.0,blue:0.0,alpha:0.5)
        self.view.addSubview(cover)
        //cover.removeFromSuperview()
    
        //if timer.valid == true{
        
            //sender.setTitle("Start Timer",forState:UIControlState.Normal)
        //}//sender.〜で値の受け渡しができる
        
   
    }
    func deleteCover(){
        self.view.addSubview(cover)
        cover.frame = CGRectMake(0,30,700, 500)
        cover.backgroundColor = UIColor(red:0.1,green:0.0,blue:0.0,alpha:0.5)
        self.view.addSubview(cover)
        cover.removeFromSuperview()
    }

    func createBtn()->String{
        //button1を生成
        btn1 = UIButton()//button作成
        btn1.tag = 1//buttonのtag設定
        btn1.frame = CGRectMake(40,30,190,320)//buttonの場所
        btn1.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:0.1)//buttonの背景
        btn1.layer.masksToBounds = true
        btn1.setTitle("btn1", forState: UIControlState.Normal)
        btn1.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        btn1.addTarget(self, action:"btn1:",forControlEvents: .TouchUpInside)///buttonに機能btn1を
        self.view.addSubview(btn1)
        
        //button2を生成
        btn2 = UIButton()
        btn2.tag = 2
        btn2.frame = CGRectMake(240,30,190,320)
        btn2.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:0.1)
        btn2.layer.masksToBounds = true
        btn2.setTitle("btn2",forState:UIControlState.Normal)
        btn2.setTitleColor(UIColor.blueColor(),forState: UIControlState.Normal)
        btn2.addTarget(self, action:"btn2:",forControlEvents: .TouchUpInside)//buttonに機能btn2をTouchUpInsideされた時に行う
        self.view.addSubview(btn2)
        
        //button3を生成
        btn3 = UIButton()
        btn3.tag = 3
        btn3.frame = CGRectMake(440,30,190,320)
        btn3.backgroundColor = UIColor(red:0.0,green:0.0,blue:1.0,alpha:0.1)
        btn3.layer.masksToBounds = true
        btn3.setTitle("btn3",forState:UIControlState.Normal)
        btn3.setTitleColor(UIColor.redColor(),forState: UIControlState.Normal)
        btn3.addTarget(self, action:"btn3:",forControlEvents: .TouchUpInside)
        self.view.addSubview(btn3)
        
        resetBtn = UIButton()
        resetBtn.frame = CGRectMake(0,0,200,30)
        resetBtn.backgroundColor = UIColor.whiteColor()
        resetBtn.layer.masksToBounds = true
        resetBtn.setTitle("start",forState:UIControlState.Normal)
        resetBtn.setTitleColor(UIColor.redColor(),forState: UIControlState.Normal)
        resetBtn.layer.position = CGPoint(x:self.view.bounds.width-100,y:10)
        resetBtn.addTarget(self, action:"startAndResetAll:",forControlEvents: .TouchUpInside)
        self.view.addSubview(resetBtn)
        
        return ("Button set.")
        
        
    }
    
    //start func
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
    func setRects(){

        //rect1描画
        rect1.frame = CGRectMake(105,260,50,30)
        rect1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        //rect1.tag = 1
        self.view.addSubview(rect1)
    
        //rect2描画
        rect2.frame = CGRectMake(80,290,100,30)
        rect2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        //rect2.tag = 1
        self.view.addSubview(rect2)

        rect3.frame = CGRectMake(55,320, 150, 30)
        rect3.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        //rect1.tag = 1
        self.view.addSubview(rect3)
    
        
    }
    func setValue(){
        ary[0][0] = 1
        ary[0][1] = 0
        ary[0][2] = 0
        ary[1][0] = 2
        ary[1][1] = 0
        ary[1][2] = 0
        ary[2][0] = 3
        ary[2][1] = 0
        ary[2][2] = 0
    }
    
    func setAll(){
        screenSize()
        println(screenSize())
        createBtn()
        println(createBtn())
        setValue()
        printAry()
        setRects()
        setMoveCount()
        setCover()
        setTimer()//一番最後でなければならない？
        
    }

    func startAndResetAll(sender:UIButton){
        btnCount++
        println(btnCount)
        switch btnCount{
        case 1:
            //timerを動かしてボタンにreset挿入
            deleteCover()
            cnt = 0
            timeLbl.text = ("Time:\(cnt)")
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1,target:self,selector:"onUpdate:",userInfo:0.0,repeats:true)
            

            println(timer)
            sender.setTitle("reset", forState:UIControlState.Normal)
        case 2:
            //timerを止めてReset,ボタンにstartを挿入
            timer.invalidate()
            cnt = 0
            timeLbl.text = ("\(timer)")
            sender.setTitle("start", forState:UIControlState.Normal)
            btnCount = 0
            setAll()
        default:
        break
        }
    }
    
    func screenSize()->(String){
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        var testDraw = DrawView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
        self.view.addSubview(testDraw)
        println("\(screenWidth)")
        println("\(screenHeight)")
        return "ScreenSize set."
    }
    //screenSizeを取るclass
    class func screenSize() -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds.size;
        if NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1
            && UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
                return CGSizeMake(screenSize.height, screenSize.width)
        }
        return screenSize
    }
    class func screenFrame() -> CGRect {
        return CGRectMake(0, 0, screenSize().width, screenSize().height)
    }
    
    func setMoveCount(){
        moveCountLbl = UILabel(frame:CGRectMake(0,0,200,30))
        moveCountLbl.backgroundColor = UIColor.blackColor()
        moveCountLbl.layer.masksToBounds = true
        moveCountLbl.layer.cornerRadius = 20.0
        moveCountLbl.text = "moveCount:\(moveCount)"
        moveCountLbl.textColor = UIColor.whiteColor()
        moveCountLbl.shadowColor = UIColor.grayColor()
        moveCountLbl.textAlignment = NSTextAlignment.Center
        moveCountLbl.layer.position = CGPoint(x:self.view.bounds.width/4,y:10)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(moveCountLbl)
        moveCount = 0
        moveCountLbl.text = ("moveCount:\(moveCount)")
    }
    func addMoveCount(){
        moveCount += 1
        moveCountLbl.text = ("moveCount:\(moveCount)")
    }
    
    func setTimer(){
        timeLbl = UILabel(frame:CGRectMake(0,0,200,30))
        timeLbl.backgroundColor = UIColor.blackColor()
        timeLbl.layer.masksToBounds = true
        timeLbl.layer.cornerRadius = 20.0
        timeLbl.text = "Time:\(cnt)"
        timeLbl.textColor = UIColor.whiteColor()
        timeLbl.shadowColor = UIColor.grayColor()
        timeLbl.textAlignment = NSTextAlignment.Center
        timeLbl.layer.position = CGPoint(x:self.view.bounds.width/2,y:10)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(timeLbl)
//        cnt = 0
//        timeLbl.text = ("\(timer)")
//        timer = NSTimer.scheduledTimerWithTimeInterval(0.1,target:self,selector:"onUpdate:",userInfo:nil,repeats:true)
    }
    
    func onUpdate(timer:NSTimer){
        cnt += 0.1
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        timeLbl.text = str
    }
    func onPostToTwitter(){
        
        let delay = 0.001 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            //SLComposeViewContorollerのインスタンス化.
            //ServiceTypeをTwitterに指定.
            self.myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            //投稿するテキストを指定.
            self.myComposeView.setInitialText("時間:\(self.cnt)秒,移動回数:\(self.moveCount)回でlevel1をクリアしました!")
            self.myComposeView.addImage(UIImage(named:"yudati.jpg"))
            self.presentViewController(self.myComposeView, animated: true, completion: nil)
        })
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

