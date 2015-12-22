//
//  ZWTheme.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/22.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

public let MainBounds: CGRect = UIScreen.mainScreen().bounds

struct theme {
    // ViewController的背景颜色
    static let SDBackgroundColor: UIColor = UIColor.colorWith(255, 255, 255, alpha: 1)
    // cache文件路径
    static let cachesPath: String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last!
}