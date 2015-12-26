//
//  ZWShareView.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWShareView: UIView {
    weak var shareVC: UIViewController?
    var shareModel: ZWShareModel?
    
    private lazy var coverBtn: UIButton! = {
        let coverBtn = UIButton(frame: MainBounds)
        coverBtn.backgroundColor = UIColor.blackColor()
        coverBtn.alpha = 0.2
        coverBtn.addTarget(self, action: "coverClick", forControlEvents: UIControlEvents.TouchUpInside)
        return coverBtn
    }()
    
    class func shareViewFromXib() -> ZWShareView {
        let shareV = NSBundle.mainBundle().loadNibNamed("ZWShareView", owner: nil, options: nil).last as! ZWShareView
        shareV.frame = CGRectMake(0, AppHeight, AppWidth, theme.ShareViewHeight)
        return shareV
    }
    
    @IBAction func weChat(sender: AnyObject) {
        hideShareView()
        ZWShareTool.shareToWeChat(self.shareModel!)
    }
    
    @IBAction func friends(sender: AnyObject) {
        hideShareView()
        ZWShareTool.shareToWeChatFriends(self.shareModel!)
    }
    
    @IBAction func sina(sender: AnyObject) {
        hideShareView()
        ZWShareTool.shareToSina(self.shareModel!, viewController: shareVC)
    }
    
    @IBAction func cancle(sender: AnyObject) {
        hideShareView()
    }
    
    func showShareView(rect: CGRect) {
        let window = UIApplication.sharedApplication().windows.last
        window?.addSubview(coverBtn)
        window?.addSubview(self)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.frame = rect
        })
    }
    
    func hideShareView() {
        coverBtn.removeFromSuperview()
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.frame = CGRectMake(0, AppHeight, AppWidth, theme.ShareViewHeight)
            }) { (finsch) -> Void in
                self.removeFromSuperview()
        }
    }
    
    func coverClick()  {
        hideShareView()
    }

}
