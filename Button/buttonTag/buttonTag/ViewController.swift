//
//  ViewController.swift
//  buttonTag
//
//  Created by 4ut0 on 2015/07/07.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var btn1: UIButton!
    private var btn2: UIButton!
    private var btn3: UIButton!
    var num:Int = 0
    enum BtnTag: Int {
        case Zero = 1,One,Two,Three,Other
        static let allValues = [Zero,One,Two,Three,Other]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    createBtn()
        
    }

    
    func createBtn(){
        for btag in BtnTag.allValues{
            var y = CGFloat(60 * btag.rawValue)
            var btn = UIButton(frame:CGRectMake(100,y,200,50))
            btn.backgroundColor = UIColor.redColor()
            btn.tag = btag.rawValue
            btn.setTitle("num:\(btag.rawValue)", forState: UIControlState.Normal)
            self.view.addSubview(btn)
            btn.addTarget(self, action: "btnAction:",forControlEvents: .TouchUpInside)
        }
        
//        btn1 = UIButton()
//        btn1.tag = 1
//        btn1.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
//        btn1.frame = CGRectMake(self.view.bounds.width/2, 200, 100, 50)
//        btn1.setTitle("btn1", forState: UIControlState.Normal)
//        btn1.addTarget(self,action: "btnAction:",forControlEvents: .TouchUpInside)
//        self.view.addSubview(btn1)
    }
    
    func btnAction(sender:UIButton){
        if sender.tag == 1 {
            println("btn1")
        }
        if sender.tag == 2 {
            println("btn2")
        }
        if sender.tag == 3 {
            println("btn3")
        }
        if sender.tag == 4 {
            println("btn4")
        }
        if sender.tag == 5 {
            println("btn5")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

