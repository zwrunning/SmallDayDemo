//
//  ZWRecommendViewController.swift
//  SmallDay
//
//  Created by Zawaya on 15/12/25.
//  Copyright © 2015年 Zawaya. All rights reserved.
//

import UIKit

class ZWRecommendViewController: UIViewController {

    private lazy var webView: UIWebView! = {
        let webView = UIWebView(frame: MainBounds)
        let url = NSURL(string: "http://www.zawaya.xyz")!
        webView.loadRequest(NSURLRequest(URL: url))
        return webView
    }()
    
    private let loadAnimatIV: ZWLoadAnimatImageView! = ZWLoadAnimatImageView.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "应用推荐"
        view.backgroundColor = theme.SDWebViewBacagroundColor
        view.addSubview(webView)
    }
}

extension ZWRecommendViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        loadAnimatIV.startLoadAnimateImageViewInView(view, center: view.center)
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        loadAnimatIV.stopLoadAnimateImageView()
    }
}
