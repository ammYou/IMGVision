//
//  HomeView.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/23.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit
import Foundation

class HomeView: UIView {
    let refreshControl:UIRefreshControl
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(model: HomeViewModel) {
        refreshControl = UIRefreshControl()
        
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
