//
//  ZWShareTool.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/26.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWShareTool: NSObject {
    
    class func shareToSina(model: ZWShareModel, viewController: UIViewController?) {
        let image: UIImage = UIImage(named: "2.png")!
        UMSocialControllerService.defaultControllerService().setShareText(model.shareDetail! + theme.BlogURL, shareImage: image, socialUIDelegate: nil)
        UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToSina).snsClickHandler(viewController, UMSocialControllerService.defaultControllerService(), true)
    }
    
    class func shareToWeChat(model: ZWShareModel) {
        UMSocialData.defaultData().extConfig.wechatSessionData.url = theme.BlogURL
        UMSocialData.defaultData().extConfig.wechatSessionData.title = model.shareTitle
        
        let image: UIImage = UIImage(named: "2.png")!
        let shareURL = UMSocialUrlResource(snsResourceType: UMSocialUrlResourceTypeImage, url: model.shareURL)
        
        UMSocialDataService.defaultDataService().postSNSWithTypes([UMShareToWechatSession], content: model.shareDetail, image: image, location: nil, urlResource: shareURL, presentedController: nil) { (response) -> Void in
            if response.responseCode.rawValue == UMSResponseCodeSuccess.rawValue {
//                .showSuccessWithStatus("分享成功")
            }
        }
    }
    
    class func shareToWeChatFriends(model: ZWShareModel) {
        
        UMSocialData.defaultData().extConfig.wechatSessionData.url = theme.BlogURL
        UMSocialData.defaultData().extConfig.wechatSessionData.title = model.shareTitle
        
        let image: UIImage = UIImage(named: "2.png")!
        let shareURL = UMSocialUrlResource(snsResourceType: UMSocialUrlResourceTypeImage, url: model.shareURL)
        
        UMSocialDataService.defaultDataService().postSNSWithTypes([UMShareToWechatTimeline], content: model.shareTitle, image: image, location: nil, urlResource: shareURL, presentedController: nil) { (response) -> Void in
            if response.responseCode.rawValue == UMSResponseCodeSuccess.rawValue {
//                SVProgressHUD.showSuccessWithStatus("分享成功")
            }
        }
    }

}
