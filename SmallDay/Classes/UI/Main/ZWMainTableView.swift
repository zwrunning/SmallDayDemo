//
//  ZWMainTableView.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/22.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWMainTableView: UITableView {

    init(frame: CGRect, style: UITableViewStyle, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        super.init(frame: frame, style: style)
        self.delegate = delegate
        self.dataSource = dataSource
        separatorStyle = .None
        backgroundColor = theme.SDBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) 
    }

}
