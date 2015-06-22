//
//  ViewController.swift
//  draw2
//
//  Created by 4ut0 on 2015/06/09.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    private var btn1: UIButton!
    private var btn2: UIButton!
    private var btn3: UIButton!
    var rect_X:Int!
    var rect_Y:Int!
    let rect_Xnum:[[Int]] = [[55,255,455],[80,280,480]]// <- 255,455,655 ->
    let rect_Ynum:[Int] = [320,290]// ^ 320,290v
    var rect1 = UIView()
    var rect2 = UIView()
    var rect3 = UIView()
    var pushBtn1:Bool! = false
    var pushBtn2:Bool! = false
    var pushBtn3:Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        screenSize()
        println(screenSize())
        createBtn()
        println(createBtn())

        //rect1を描画
        rect1.frame = CGRectMake(55,320, 150, 30)
        rect1.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        rect1.tag = 1
        self.view.addSubview(rect1)
        
        //rect2描画
        rect2.frame = CGRectMake(80,290,100,30)
        rect2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        rect2.tag = 1
        self.view.addSubview(rect2)
        
        //rect3描画
        rect3.frame = CGRectMake(105,260,50,30)
        rect3.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        rect3.tag = 1
        self.view.addSubview(rect3)
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

        rect1.frame = CGRectMake(CGFloat(rect_X), CGFloat(rect_Y), 150, 30)
        rect1.backgroundColor = UIColor(red:1.0,green:0.0,blue:0.0,alpha:1.0)
        self.view.addSubview(rect1)
        //rect1.removeFromSuperview()
        rect1.tag = 1
        println(rect_X)
        self.view.addSubview(rect1)
        println("done moveRect1")
    }
    func moveRect2(){
        
        rect2.frame = CGRectMake(CGFloat(rect_X), CGFloat(rect_Y), 100, 30)
        rect2.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:1.0)
        self.view.addSubview(rect2)
        //rect1.removeFromSuperview()
        //rect2.tag = 1
        println(rect_X)
        self.view.addSubview(rect2)
        println("done moveRect2")
    }
    
    //btnAction
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
            if rect2.tag == 2{
                //rect2が左にいるとき真ん中に移す
                if rect1.tag == 1{
                    //rect1が真ん中にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][0]
                    rect_Y = rect_Ynum[1]
                    pushBtn2 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][0]
                    rect_Y = rect_Ynum[0]
                    pushBtn2 = false
                }
                moveRect2()
                rect2.tag = 1
            }
            if rect1.tag == 2 && pushBtn2 == true{
                rect_X = rect_Xnum[0][0] //55へ
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 1
                pushBtn2 = false
            }
            
            
            
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            //そうでなくてボタン3が押されていた場合,右に描画して元に戻す
            //FFT ->  3 -> 1に
            if rect2.tag == 3 {
                //rect2が右にいるとき真ん中に移す
                if rect1.tag == 1{
                    //rect1が真ん中にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][0]
                    rect_Y = rect_Ynum[1]
                    pushBtn3 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][0]
                    rect_Y = rect_Ynum[0]
                    pushBtn3 = false
                }
                moveRect2()
                rect2.tag = 1
            }
            if rect1.tag == 3 && pushBtn3 == true{
                rect_X = rect_Xnum[0][0]
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 1
                pushBtn3 = false
            }
            
            
        }else{//それ意外だった場合初期化する
            pushBtn1 = false
            pushBtn2 = false
            pushBtn3 = false
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
            if rect2.tag == 1{
                //rect2が左にいるとき真ん中に移す
                if rect1.tag == 2{
                    //rect1が真ん中にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][1]
                    rect_Y = rect_Ynum[1]
                    pushBtn1 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][1]
                    rect_Y = rect_Ynum[0]
                    pushBtn1 = false
                }
                moveRect2()
                rect2.tag = 2
            }
            if rect1.tag == 1 && pushBtn1 == true{
                rect_X = rect_Xnum[0][1] //55へ
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 2
                pushBtn1 = false
            }
            
        }else if pushBtn1 == false && pushBtn2 == false && pushBtn3 == true{
            
            //FFT ->  3 -> 2に
            if rect2.tag == 3 {
                //rect2が右にいるとき真ん中に移す
                if rect1.tag == 2{
                    //rect1が真ん中にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][1]
                    rect_Y = rect_Ynum[1]
                    pushBtn3 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][1]
                    rect_Y = rect_Ynum[0]
                    pushBtn3 = false
                }
                moveRect2()
                rect2.tag = 2
            }
            if rect1.tag == 3 && pushBtn3 == true{
                rect_X = rect_Xnum[0][1]
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 2
                pushBtn3 = false
            }
        }else{
            pushBtn1 = false
            pushBtn2 = false
            pushBtn3 = false
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
            if rect2.tag == 1{
                //rect2が左にいるとき右に移す
                if rect1.tag == 3{
                    //rect1が右にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][2]
                    rect_Y = rect_Ynum[1]
                    pushBtn1 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][2]
                    rect_Y = rect_Ynum[0]
                    pushBtn1 = false
                }
                moveRect2()
                rect2.tag = 3
            }
            if rect1.tag == 1 && pushBtn1 == true{
                rect_X = rect_Xnum[0][2] //55へ
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 3
                pushBtn1 = false
            }
        }else if pushBtn1 == false && pushBtn2 == true && pushBtn3 == false{
            
            //そうでなくてボタン2が押されていた場合,真ん中に描画して元に戻す
            //FTF 2 -> 3
            if rect2.tag == 2 {
                //rect2が右にいるとき真ん中に移す
                if rect1.tag == 3{
                    //rect1が真ん中にいるときrect1の上に描画
                    rect_X = rect_Xnum[1][2]
                    rect_Y = rect_Ynum[1]
                    pushBtn2 = false
                }else{
                    //そうでないなら地面に描画
                    rect_X = rect_Xnum[1][2]
                    rect_Y = rect_Ynum[0]
                    pushBtn2 = false
                }
                moveRect2()
                rect2.tag = 3
            }
            if rect1.tag == 2 && pushBtn2 == true{
                rect_X = rect_Xnum[0][2]
                rect_Y = rect_Ynum[0]//320へ
                moveRect1()
                rect1.tag = 3
                pushBtn2 = false
            }
            
            
            
        }else{
            pushBtn1 = false
            pushBtn2 = false
            pushBtn3 = false
        }
    }
    
    //check func
    func checkPushBtns(){
        print(" pushBtn1 == \(pushBtn1)")
        print(" pushBtn2 ==\(pushBtn2)")
        print(" pushBtn3 ==\(pushBtn3)")
        print(" rect1.tag ==\(rect1.tag)")
        print(" rect2.tag ==\(rect2.tag)")
        println()
        
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

