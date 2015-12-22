//
//  ZWIconView.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/23.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWIconView: UIView {

    var iconButton: UIButton!
    weak var delegate: ZWIconViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.clearColor()
        iconButton = UIButton(type: .Custom)
        iconButton.setImage(UIImage(named: "my"), forState: .Normal)
        iconButton.addTarget(self, action: "iconBtnClick", forControlEvents: .TouchUpInside)
        iconButton.clipsToBounds = true
        addSubview(iconButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin: CGFloat = 8
        iconButton.frame = CGRectMake(margin, margin, self.width - margin * 2, self.height - margin * 2)
        iconButton.setBackgroundImage(UIImage(named: "white")?.imageClipOvalImage(), forState: .Normal)
    }
    
    override func drawRect(rect: CGRect) {
        let circleWidth: CGFloat = 2
        // 圆角矩形
        let path = UIBezierPath(roundedRect: CGRectMake(circleWidth, circleWidth, rect.size.width - circleWidth * 2, rect.size.width - circleWidth * 2), cornerRadius: rect.size.width)
        path.lineWidth = circleWidth
        UIColor.whiteColor().set()
        path.stroke()
    }
    
    func iconBtnClick() {
        delegate?.iconView(self, didClick: self.iconButton)
    }
}

protocol ZWIconViewDelegate: NSObjectProtocol {
    func iconView(iconView: ZWIconView, didClick iconButton: UIButton)
}
