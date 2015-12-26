//
//  ZWSettingViewController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWSettingViewController: UITableViewController {
    
    private lazy var images: NSMutableArray! = {
        var array = NSMutableArray(array: ["score", "recommendfriend", "about",  "feedback","score", "remove"])
        return array
    }()
    
    private lazy var titles: NSMutableArray! = {
        var array = NSMutableArray(array: ["恭喜发财", "推荐给朋友", "关于我们", "我的github","我的博客", "清理缓存"])
        return array
    }()
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置tableView
        setupTableView()
    }
    
    /// 设置tableView
    private func setupTableView() {
        tableView.backgroundColor = theme.SDBackgroundColor
        tableView.rowHeight = 50
        tableView.separatorStyle = .None
        tableView.registerNib(UINib(nibName: "ZWSettingCell", bundle: nil), forCellReuseIdentifier: "settingCell")
    }

    deinit {
        print("设置控制器被销毁了", terminator: "")
    }
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell", forIndexPath: indexPath) as! ZWSettingCell
        cell.imageImageView.image = UIImage(named: images[indexPath.row] as! String)
        cell.titleLabel.text = titles[indexPath.row] as? String
        
        if indexPath.row == ZWSettingCellType.Clean.hashValue {
            cell.bottomView.hidden = true
            cell.sizeLabel.hidden = false
            cell.sizeLabel.text =  String().stringByAppendingFormat("%.2f M", ZWFileTool.folderSize(theme.cachesPath))
            
            
        } else {
            cell.bottomView.hidden = false
            cell.sizeLabel.hidden = true
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == ZWSettingCellType.About.hashValue {
            let aboutVC = ZWAboutViewController()
            navigationController!.pushViewController(aboutVC, animated: true)
            
        } else if indexPath.row == ZWSettingCellType.Recommend.hashValue {
            let share = ZWShareView.shareViewFromXib()
            share.shareVC = self
            let shareModel = ZWShareModel(shareTitle: "嗨小朋友们", shareURL: theme.BlogURL, image: UIImage(named: "2.png"), shareDetail: "小弟别比比")
            share.shareModel = shareModel
            view.addSubview(share)
//            share.showShareView()
            share.showShareView(CGRectMake(0, AppHeight - theme.ShareViewHeight, AppWidth, theme.ShareViewHeight))
            
        } else if indexPath.row == ZWSettingCellType.Clean.hashValue {
            weak var tmpSelf = self
            ZWFileTool.cleanFolder(theme.cachesPath, complete: { () -> () in
                tmpSelf!.tableView.reloadData()
            })
            
        } else if indexPath.row == ZWSettingCellType.GitHub.hashValue {
            theme.appShare.openURL(NSURL(string: theme.GitHubURL)!)
            
        } else if indexPath.row == ZWSettingCellType.Blog.hashValue {
            theme.appShare.openURL(NSURL(string: theme.BlogURL)!)
            
        } else if indexPath.row == ZWSettingCellType.Sina.hashValue {
            theme.appShare.openURL(NSURL(string: theme.sinaURL)!)
            
        }
    }
    
}
