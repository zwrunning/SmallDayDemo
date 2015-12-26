//
//  ZWFileTool.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWFileTool: NSObject {
    
    static let fileManager = NSFileManager.defaultManager()
    
    /// 计算单个文件大小
    class func fileSize(path: String) -> Double {
        if fileManager.fileExistsAtPath(path) {
            var dict = try? fileManager.attributesOfItemAtPath(path)
            if let fileSize = dict![NSFileSize] as? Int{
                return Double(fileSize) / 1024.0 / 1024.0
            }
        }
        return 0.0
    }
    
    /// 计算整个文件夹大小
    class func folderSize(path: String) -> Double {
        var folderSize: Double = 0
        if fileManager.fileExistsAtPath(path) {
            let chilerFiles = fileManager.subpathsAtPath(path)
            for fileName in chilerFiles! {
                let tempPath = path as NSString
                let fileFullPathName = tempPath.stringByAppendingPathComponent(fileName)
                folderSize += ZWFileTool.fileSize(fileFullPathName)
            }
            return folderSize
        }
        return 0
    }
    
    /// 彻底清除文件夹,异步
    class func cleanFolder(path: String, complete:() -> ()) {
//        SVProgressHUD.showWithStatus("正在清理缓存", maskType: SVProgressHUDMaskType.Clear)
        let queue = dispatch_queue_create("cleanQueue", nil)
        
        dispatch_async(queue) { () -> Void in
            let chilerFiles = self.fileManager.subpathsAtPath(path)
            for fileName in chilerFiles! {
                let tmpPath = path as NSString
                let fileFullPathName = tmpPath.stringByAppendingPathComponent(fileName)
                if self.fileManager.fileExistsAtPath(fileFullPathName) {
                    do {
                        try self.fileManager.removeItemAtPath(fileFullPathName)
                    } catch _ {
                    }
                }
            }
            
            // 线程睡1秒 测试,实际用到是将下面代码删除即可
            NSThread.sleepForTimeInterval(1.0)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                SVProgressHUD.dismiss()
                complete()
            })
        }
    }
}
