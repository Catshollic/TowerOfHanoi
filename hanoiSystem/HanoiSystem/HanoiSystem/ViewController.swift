//
//  ViewController.swift
//  HanoiSystem
//
//  Created by 4ut0 on 2015/07/10.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    Print.print()
    }
    
class System {
    var num:Int = 1
    }
    
    class Print:System{
        func print(num: 2){
            println("\(num)番")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

