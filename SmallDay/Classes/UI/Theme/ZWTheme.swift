//
//  ZWTheme.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/22.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 64
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

struct theme {
    //  APP导航条barButtonItem文字大小
    static let SDNavItemFont: UIFont = UIFont.systemFontOfSize(16)
    // ViewController的背景颜色
    static let SDBackgroundColor: UIColor = UIColor.colorWith(255, 255, 255, alpha: 1)
    // webView的背景颜色
    static let SDWebViewBacagroundColor: UIColor = UIColor.colorWith(245, 245, 245, alpha: 1)
    // 自定义分享view的高度
    static let ShareViewHeight: CGFloat = 215
    // 友盟分享的APP key
    static let UMSharedAPPKey: String = "567d5f4067e58ed5010026fa"
    static let BlogURL: String = "http://www.zawaya.xyz"
    // UIApplication.sharedApplication()
    static let appShare = UIApplication.sharedApplication()
    static let sinaURL = "http://weibo.com/"
    static let GitHubURL: String = "https://github.com/zwrunning"
    // cache文件路径
    static let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!
}