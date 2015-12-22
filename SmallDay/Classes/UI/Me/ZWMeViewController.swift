//
//  ZWMeViewController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/22.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

public let SD_UserIconData_Path = theme.cachesPath + "/iconImage.data"

enum SDMineCellType: Int {
    // 个人中心
    case MyCenter = 0
    // 我的订单
    case MyOrder = 1
    // 我的收藏
    case MyCollect = 2
    // 反馈留言
    case Feedback = 3
    // 应用推荐
    case RecommendApp = 4
}

class ZWMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
