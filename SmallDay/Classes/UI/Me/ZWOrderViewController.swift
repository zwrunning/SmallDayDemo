//
//  ZWOrderViewController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backGroundImage = UIImageView()
        backGroundImage.center = CGPointMake(view.bounds.width * 0.5, view.bounds.height * 0.5)
        backGroundImage.bounds = CGRectMake(0, 0, 92, 92)
        backGroundImage.image = UIImage(named: "noorders")
        view.addSubview(backGroundImage)
        
        title = "我的订单"
        view.backgroundColor = theme.SDBackgroundColor
        
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
