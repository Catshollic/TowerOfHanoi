// Playground - noun: a place where people can play

import UIKit

class User{
    //メール送信の依頼書
    let delegate :MailDelegate?
    
    //ボタンが押された時の処理
    func sendButtonPushed(){
        
    }
}

class MailServer{
    //メールを送信する
    func sendMail(){
        
    }
}

protocol MailDelegate{
    
        func sendMail()->Void
}

