//
//  ZWTabBarController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/22.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAllChildViewController()
        
        self.setValue(MainTabBar(), forKeyPath: "tabBar")
    }

    /// 初始化所有子控制器
    private func setupAllChildViewController() {
        // 探店
        tabBarAddChildViewController(vc: ZWExploreViewController(), title: "探店", imageName: "recommendation_1", selectedImageName: "recommendation_2")
        // 体验
        tabBarAddChildViewController(vc: ZWExperienceViewController(), title: "体验", imageName: "broadwood_1", selectedImageName: "broadwood_2")
        // 分类
        tabBarAddChildViewController(vc: ZWClassifyViewController(), title: "分类", imageName: "classification_1", selectedImageName: "classification_2")
        // 我的
         tabBarAddChildViewController(vc: ZWMeViewController(), title: "我的", imageName: "my_1", selectedImageName: "my_2")
    }

    private func tabBarAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        vc.view.backgroundColor = theme.SDBackgroundColor
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
}

class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translucent = false
        self.backgroundImage = UIImage(named: "tabbar")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
