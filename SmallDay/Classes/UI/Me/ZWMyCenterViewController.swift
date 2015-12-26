//
//  ZWMyCenterViewController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/23.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWMyCenterViewController: UIViewController {

    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var iconView: ZWIconView!
    @IBOutlet weak var alertPwdView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: "alterPwdViewClick")
        alertPwdView.userInteractionEnabled = true
        alertPwdView.addGestureRecognizer(tap)
        accountLabel.text = ZWUserAccountTool.userAccount()!
        
        if let data = NSData(contentsOfFile: SD_UserIconData_Path) {
            let image: UIImage = UIImage(data: data)!
            iconView.iconButton.setImage(image.imageClipOvalImage(), forState: .Normal)
        }
    }
    
    func alterPwdViewClick() {
        print("呵呵呵")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutClick(sender: AnyObject) {
        let user = NSUserDefaults.standardUserDefaults()
        user.setObject(nil, forKey: SD_UserDefaults_Account)
        user.setObject(nil, forKey: SD_UserDefaults_Password)
        if user.synchronize() {
            navigationController?.popViewControllerAnimated(true)
        }
        do {
            // 将本地的icon图片data删除
            try NSFileManager.defaultManager().removeItemAtPath(SD_UserIconData_Path)
        } catch _ {
            
        }
        
       
    }
    
    deinit {
        print("个人中心控制器被销毁")
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
