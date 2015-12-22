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
    
    private var loginLabel: UILabel!
    private var tableView: UITableView!
    private lazy var pickVC: UIImagePickerController = {
       let pickVC = UIImagePickerController()
        pickVC.delegate = self
        pickVC.allowsEditing = true
        return pickVC
    }()
    private lazy var mineIcons: NSMutableArray = NSMutableArray(array: ["usercenter", "orders", "setting_like", "feedback", "recomment"])
    private lazy var iconActionSheet: UIActionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "拍照", "从手机相册选择")
    private lazy var mineTitles: NSMutableArray = NSMutableArray(array: ["个人中心", "我的订单", "我的收藏", "留言反馈", "应用推荐"])
    private var iconView: ZWIconView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化导航条
        setupNav()
        // 设置tableView
        setupTableView()
    }

    /// 初始化导航条
    private func setupNav() {
        navigationItem.title = "我的"
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "settinghhhh", highlImageName: "settingh", target: self, action: "settingClick")
    }
    
    /// 初始化tableView
    private func setupTableView() {
        
        tableView = UITableView(frame: CGRectMake(0, 0, AppWidth, AppHeight - NavigationH - 49), style: UITableViewStyle.Grouped)
        tableView.backgroundColor = UIColor.colorWith(245, 245, 245, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 45
        tableView.sectionFooterHeight = 0.1
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
        // 设置tableView的headerView
        let iconImageViewHeight: CGFloat = 180
        let iconImageView = UIImageView(frame: CGRectMake(0, 0, AppWidth, iconImageViewHeight))
        iconImageView.image = UIImage(named: "quesheng")
        iconImageView.userInteractionEnabled = true
        
        // 添加未登录的文字
        let loginLabelHeight: CGFloat = 40
        loginLabel = UILabel(frame: CGRectMake(0, iconImageViewHeight - loginLabelHeight, AppWidth, loginLabelHeight))
        loginLabel.textAlignment = .Center
        loginLabel.text = "登陆,开始我的小日子"
        loginLabel.font = UIFont.systemFontOfSize(16)
        loginLabel.textColor = UIColor.colorWith(80, 80, 80, alpha: 1)
        iconImageView.addSubview(loginLabel)
        
        // 添加iconImageView
        iconView = ZWIconView(frame: CGRectMake(0, 0, 100, 100))
        iconView!.delegate = self
        iconView!.center = CGPointMake(iconImageView.width * 0.5, (iconImageViewHeight - loginLabelHeight) * 0.5 + 8)
        iconImageView.addSubview(iconView!)
        
        tableView.tableHeaderView = iconImageView
    }

    func settingClick() {
        let settingVC = UIViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loginLabel.hidden = ZWUserAccountTool.userIsLogin()
        if ZWUserAccountTool.userIsLogin() {
            if let data = NSData(contentsOfFile: SD_UserIconData_Path) {
                iconView!.iconButton.setImage(UIImage(data: data)!.imageClipOvalImage(), forState: .Normal)
            } else {
                iconView!.iconButton.setImage(UIImage(named: "my"), forState: .Normal)
            }
        } else {
            iconView!.iconButton.setImage(UIImage(named: "my"), forState: .Normal)
        }
    }
    
}
/// iconViewDelegate
extension ZWMeViewController: ZWIconViewDelegate {
    func iconView(iconView: ZWIconView, didClick iconButton: UIButton) {
        // 判断用户是否登陆了
        if ZWUserAccountTool.userIsLogin() {
            iconActionSheet.showInView(view)
        } else {
            let login = UIViewController()
            navigationController?.pushViewController(login, animated: true)
        }
    }
}

/// UIActionSheetDelegate
extension ZWMeViewController: UIActionSheetDelegate {
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 1:
            openCamera()
        case 2:
            openUserPhotoLibrary()
        default:
            print("呵呵")
        }
    }
}

/// 摄像机和相册代理方法
extension ZWMeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// 打开照相功能
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            pickVC.sourceType = .Camera
            self.presentViewController(pickVC, animated: true, completion: nil)
        } else {
            print("呵呵heheh")
        }
    }
    
    /// 打开相册
    private func openUserPhotoLibrary() {
        pickVC.sourceType = .PhotoLibrary
        pickVC.allowsEditing = true
        presentViewController(pickVC, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // 对用户选中的图片进行质量压缩，上传服务器，本地持久化储存
        if let typeStr = info[UIImagePickerControllerMediaType] as? String {
            if typeStr == "public.image" {
                if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
                    var data: NSData?
                    let smallImage = UIImage.imageClipToNewImage(image, newSize: iconView!.iconButton.size)
                    if UIImagePNGRepresentation(smallImage) == nil {
                        data = UIImageJPEGRepresentation(smallImage, 0.8)
                    } else {
                        data = UIImagePNGRepresentation(smallImage)
                    }
                    if data != nil {
                        do {
                            // TODO: 将头像的data传入服务器
                            // 本地保留一份data数据
                            try NSFileManager.defaultManager().createDirectoryAtPath(theme.cachesPath, withIntermediateDirectories: true, attributes: nil)
                        } catch _ {
                        }
                        NSFileManager.defaultManager().createFileAtPath(SD_UserIconData_Path, contents: data, attributes: nil)
                        iconView?.iconButton.setImage(UIImage(data: NSData(contentsOfFile: SD_UserIconData_Path)!)!.imageClipOvalImage(), forState: .Normal)
                    } else {
                        print("照片保存失败")
                    }
                }
            }
        } else {
            print("失败")
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        pickVC.dismissViewControllerAnimated(true, completion: nil)
    }

}

/// MARK:UITableViewDelegate, UITableViewDataSource 代理方法
extension ZWMeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return mineIcons.count
        } else {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell!.selectionStyle = .None
        }
        if indexPath.section == 0 {
            cell!.imageView!.image = UIImage(named: mineIcons[indexPath.row] as! String)
            cell!.textLabel?.text = mineTitles[indexPath.row] as? String
        } else {
            cell!.imageView!.image = UIImage(named: "yaoyiyao")
            cell!.textLabel!.text = "摇一摇 每天都有小惊喜"
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            
            if indexPath.row == SDMineCellType.Feedback.hashValue {         // 留言反馈
                let feedbackVC = UIViewController()
                navigationController?.pushViewController(feedbackVC, animated: true)
            } else if indexPath.row == SDMineCellType.MyCenter.hashValue {  // 个人中心
                if ZWUserAccountTool.userIsLogin() {
                    let myCenterVC = UIViewController()
                    navigationController!.pushViewController(myCenterVC, animated: true)
                } else {
                    let login = UIViewController()
                    navigationController?.pushViewController(login, animated: true)
                }
                
            } else if indexPath.row == SDMineCellType.MyCollect.hashValue { // 我的收藏
                
            } else if indexPath.row == SDMineCellType.MyOrder.hashValue {   // 我的订单
                if ZWUserAccountTool.userIsLogin() {
                    let orderVC = UIViewController()
                    navigationController!.pushViewController(orderVC, animated: true)
                } else {
                    let login = UIViewController()
                    navigationController?.pushViewController(login, animated: true)
                }
            } else {                                                        // 应用推荐
                let rmdVC = UIViewController()
                navigationController!.pushViewController(rmdVC, animated: true)
            }
            
        } else {
            let shakeVC = UIViewController()
            navigationController?.pushViewController(shakeVC, animated: true)
        }
    }
    
}
