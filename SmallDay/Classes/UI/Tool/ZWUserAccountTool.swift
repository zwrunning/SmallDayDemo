//
//  ZWUserAccountTool.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/23.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

public let SD_UserLogin_Notification = "SD_UserLogin_Notification"
public let SD_UserDefaults_Account = "SD_UserDefaults_Account"
public let SD_UserDefaults_Password = "SD_UserDefaults_Password"

class ZWUserAccountTool: NSObject {

    /// 判断用户是否登陆
    class func userIsLogin() -> Bool {
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(SD_UserDefaults_Account) as? String
        let password = user.objectForKey(SD_UserDefaults_Password) as? String
        
        if account != nil && password != nil {
            if !account!.isEmpty && !password!.isEmpty {
                return true
            }
        }
        return false
    }
    
    /// 如果用户登陆了，返回用户的账号
    class func userAccount() -> String? {
        if !userIsLogin() {
            return nil
        }
        let user = NSUserDefaults.standardUserDefaults()
        let account = user.objectForKey(SD_UserDefaults_Account) as? String
        return account
    }
}
