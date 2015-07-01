//
//  DrawView.swift
//  draw2
//
//  Created by 4ut0 on 2015/06/10.
//  Copyright (c) 2015年 4ut. All rights reserved.
//

import UIKit

class DrawView: UIView {
    override func drawRect(rect: CGRect) {
        var x:Int = 130
        var y:Int = 100
        
        // UIBezierPath のインスタンス生成
        let pillarline = UIBezierPath()
        let floorLine = UIBezierPath()

        
        //Draw floorLine
        floorLine.moveToPoint(CGPointMake(CGFloat(x-130),CGFloat(y+250)))
        floorLine.addLineToPoint(CGPointMake(CGFloat(x+580),CGFloat(y+250)))
        UIColor.whiteColor().setStroke()
        floorLine.lineWidth = 1//default = 1
        floorLine.stroke();
        
        // Draw pillarLine
        for i in 1...3{
        pillarline.moveToPoint(CGPointMake(CGFloat(x),CGFloat(y)))//150,300
        pillarline.addLineToPoint(CGPointMake(CGFloat(x),CGFloat(y+250)))//150,100
        x += 200
        }
        UIColor.whiteColor().setStroke()
        pillarline.lineWidth = 5//default = 1
        pillarline.stroke();
        

        
        
//        var rect1:CGContextRef = UIGraphicsGetCurrentContext()
//        CGContextSetRGBStrokeColor(rect1, 1.0, 0.0, 0.0, 1.0)
//        CGContextSetLineWidth(rect1, 2.0)
//        CGContextSet
     
//        //現在のグラフィックスコンテキストを取得
//        var cgContext:CGContextRef  = UIGraphicsGetCurrentContext();
//        
//        //ストロークカラーの設定(0.0-1.0でRGBAを指定する)
//        CGContextSetRGBStrokeColor(cgContext, 1.0, 1.0, 1.0,1.0);
//        
//        //ストロークの線幅を設定
//        CGContextSetLineWidth(cgContext, 2.0);
//        
//        //カレントポイントから指定した座標に向けて線を引く
//        CGContextStrokeEllipseInRect(cgContext, CGRectMake(50.0, 50.0,100.0,100.0));
// 
//               CGContextSetRGBStrokeColor(cgContext, 1.0, 0.0, 0.0,1.0);
//        //パスに円を追加 パス→背景?cambus?
//        CGContextAddEllipseInRect(cgContext, CGRectMake(50.0, 200.0, 100.0, 100.0));
//        
//        //画面に描画
//        CGContextStrokePath(cgContext);
        
    }
}