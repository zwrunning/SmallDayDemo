//
//  ZWUIView+zwView.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/23.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

/// UIView的扩展
extension UIView {
    // x
    var x: CGFloat {
        return self.frame.origin.x
    }
    // Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    // 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    //高度
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}