//
//  ZWShareModel.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWShareModel: NSObject {

    var shareTitle: String?
    var shareURL: String?
    var img: UIImage?
    var shareDetail: String?
    
    init(shareTitle: String?, shareURL: String?, image: UIImage?, shareDetail: String?) {
        super.init()
        if shareDetail != nil {
            if let text: NSString = NSString(CString: shareDetail!.cStringUsingEncoding(NSUTF8StringEncoding)!, encoding: NSUTF8StringEncoding) {
                if text.length > 50 {
                    let a = text.substringToIndex(50)
                    self.shareDetail = a as String
                } else {
                    self.shareDetail = shareDetail
                }
            }
        }
        self.shareTitle = shareTitle
        self.img = image
        self.shareURL = shareURL
    }
}
