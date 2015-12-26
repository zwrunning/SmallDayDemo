//
//  ZWLoadAnimatImageView.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWLoadAnimatImageView: NSObject {

    private static let sharedInstance = ZWLoadAnimatImageView()
    class var sharedManager : ZWLoadAnimatImageView {
        return sharedInstance
    }
    
    private lazy var loadImageView: UIImageView! = {
        let loadImageView = UIImageView()
        loadImageView.animationImages = self.loadAnimatImages!
        loadImageView.animationRepeatCount = 10000
        loadImageView.animationDuration = 1.0
        loadImageView.frame = CGRectMake(0, 0, 44, 51)
        return loadImageView
    }()
    
    private lazy var loadAnimatImages: [UIImage]? = {
        var images = [UIImage]()
        for i in 0...92 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            images.append(image!)
        }
        return images
    }()
    
    func startLoadAnimateImageViewInView(view: UIView, center: CGPoint) {
        loadImageView.center = center
        view.addSubview(loadImageView)
        loadImageView.startAnimating()
    }
    
    func stopLoadAnimateImageView() {
        loadImageView.removeFromSuperview()
        loadImageView.stopAnimating()
    }
}
