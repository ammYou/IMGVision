//
//  TitleView.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/09.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit

class TitleView: UIView {
    var view = UIView()
    
    init(root: UIViewController) {
        super.init(frame: view.frame)
        self.view = root.view
        let titleLabel = UILabel(
            frame: CGRect(x: 0,
                          y: 0,
                          width: self.view.frame.width*0.6,
                          height: self.view.frame.height*0.3))
        titleLabel.center = CGPoint(x: self.view.frame.width*0.5,
                                    y: self.view.frame.height*0.2)
        titleLabel.text = "IMGVision"
        titleLabel.font = UIFont(name: "Futura-Medium" , size: 50)
        titleLabel.textColor = UIColor.color(76, green: 80, blue: 84, alpha: 1.0)//76    80    84
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.adjustsFontSizeToFitWidth = true
        addSubview(titleLabel)
    }
    
    func makeTitleLabel(){
        
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
