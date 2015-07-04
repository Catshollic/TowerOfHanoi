//
//  ViewController.swift
//  tweet
//
//  Created by 4ut0 on 2015/07/04.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {

    var myComposeView:SLComposeViewController!
    var myTwitterButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
        setUp()
        onPostToTwitter()
    }
    
    func setUp(){
        let hex:Int = 0x55ACEE
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        var myColor:UIColor = UIColor(red:CGFloat(red),green:CGFloat(green),blue:CGFloat(blue),alpha:CGFloat(1.0))
        
        
//        //button
//        myTwitterButton = UIButton()
//        myTwitterButton.frame = CGRectMake(0,0,100,100)
//        myTwitterButton.backgroundColor = myColor
//        myTwitterButton.layer.masksToBounds = true
//        myTwitterButton.setTitle("Twitter", forState:UIControlState.Normal)
//        myTwitterButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(20))
//        myTwitterButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        myTwitterButton.layer.cornerRadius = 50.0
//        myTwitterButton.layer.position =  CGPoint(x:self.view.frame.width/2,y: self.view.frame.height/2)
//        myTwitterButton.tag = 1
//        myTwitterButton.addTarget(self, action:"onPostToTwitter:", forControlEvents:.TouchUpInside)
//        self.view.addSubview(myTwitterButton)
    }
    func onPostToTwitter(){
        
        let delay = 0.001 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            //SLComposeViewContorollerのインスタンス化.
            //ServiceTypeをTwitterに指定.
            self.myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            //投稿するてキスを指定.
            self.myComposeView.setInitialText("#夕立ちゃん困り顔ツイートアプリ")
            self.myComposeView.addImage(UIImage(named:"yudati.jpg"))
            self.presentViewController(self.myComposeView, animated: true, completion: nil)
        })
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

