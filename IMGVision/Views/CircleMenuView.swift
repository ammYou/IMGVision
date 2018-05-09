//
//  CircleView.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/09.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit
import CircleMenu

class CircleMenuView: UIView {
    var view = UIView()
    
    init(root: UIViewController) {
        super.init(frame: root.view.frame)
        self.view = root.view//view
        let homeCircleButton = CircleMenu(
            frame: CGRect(x: 100,
                          y: 100,
                          width: self.view.frame.width*0.2,
                          height: self.view.frame.width*0.2),
            normalIcon:"icons8-top_menu",
            selectedIcon:"icons8-top_menu_filled",
            buttonsCount: 3,
            duration: 2,
            distance: 140)
        homeCircleButton.delegate = root
        homeCircleButton.center = CGPoint(x: self.view.bounds.width*0.5,
                                          y: self.view.bounds.height*0.5)
        homeCircleButton.layer.cornerRadius = homeCircleButton.bounds.size.width*0.5
        addSubview(homeCircleButton)
        //homeCircleButton.backgroundColor = UIColor.color(94, green: 94, blue: 94, alpha: 1.0)
    }
    
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
