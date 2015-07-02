//
//  ViewController.swift
//  timer
//
//  Created by 4ut0 on 2015/07/02.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //時間計測用の変数
    var cnt:Float = 0
    var timeLbl:UILabel!
    var timer :NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLbl = UILabel(frame:CGRectMake(0,0,200,50))
        timeLbl.backgroundColor = UIColor.orangeColor()
        timeLbl.layer.masksToBounds = true
        timeLbl.layer.cornerRadius = 20.0
        timeLbl.text = "Time:\(cnt)"
        timeLbl.textColor = UIColor.whiteColor()
        timeLbl.shadowColor = UIColor.grayColor()
        timeLbl.textAlignment = NSTextAlignment.Center
        timeLbl.layer.position = CGPoint(x:self.view.bounds.width/2,y:200)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(timeLbl)
    
        //タイマー停止ボタンを作る
        let stopButton = UIButton(frame:CGRectMake(0,0,200,50))
        stopButton.layer.masksToBounds = true
        stopButton.layer.cornerRadius = 20.0
        stopButton.backgroundColor = UIColor.blueColor()
        stopButton.setTitle("stop Timer", forState: UIControlState.Normal)
        stopButton.layer.position = CGPointMake(self.view.center.x,self.view.center.y + 100)
      stopButton.addTarget(self,action:"onStopButtonClick:",forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(stopButton)
    
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1,target:self,selector:"onUpdate:",userInfo:nil,repeats:true)
    }
    
    func onStopButtonClick(sender:UIButton){
        if timer.valid == true{
            timer.invalidate()
            sender.setTitle("Start Timer",forState:UIControlState.Normal)
        }else{
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1,target:self,selector:"onUpdate:",userInfo:nil,repeats:true)
        sender.setTitle("Stop Timer", forState: UIControlState.Normal)
        }//sender.〜で値の受け渡しができる
    }
    
    func onUpdate(timer:NSTimer){
        cnt += 0.1
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        timeLbl.text = str
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

