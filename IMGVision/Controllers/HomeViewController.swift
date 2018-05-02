//
//  HomeViewController.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/01.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit
import Hero
import CircleMenu

extension UIColor {
    static func color(_ red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(
            red: 1.0 / 255.0 * CGFloat(red),
            green: 1.0 / 255.0 * CGFloat(green),
            blue: 1.0 / 255.0 * CGFloat(blue),
            alpha: CGFloat(alpha))
    }
}

extension UIImage {
    // resize image
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height));
        let reSizeImage:UIImage! = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return reSizeImage;
    }

    
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
}

class HomeViewController: UIViewController, CircleMenuDelegate {
    
    let items: [(icon: String, color: UIColor)] = [
        ("icons8-camera", UIColor.color(253, green: 200, blue: 58, alpha: 1)),//253    200    58
        ("icons8-picture", UIColor.color(29, green: 148, blue: 79, alpha: 1)),//29    148    79
        ("icons8-settings", UIColor.color(56, green: 112, blue: 240, alpha: 1))//56    112    240
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeCircleButton = CircleMenu(
            frame: CGRect(x: 100,
                          y: 100,
                          width: self.view.frame.width/6,
                          height: self.view.frame.width/6),
            normalIcon:"icons8-top_menu",
            selectedIcon:"icons8-top_menu_filled",
            buttonsCount: 3,
            duration: 2,
            distance: 140)
        
        homeCircleButton.delegate = self
        homeCircleButton.center.x = self.view.bounds.width/2
        homeCircleButton.center.y = self.view.bounds.height/2
        homeCircleButton.layer.cornerRadius = homeCircleButton.bounds.size.width / 2.0
       // homeCircleButton.backgroundColor = UIColor.color(94, green: 94, blue: 94, alpha: 1.0)
            
        self.view.addSubview(homeCircleButton)
        self.view.backgroundColor =  UIColor.color(242, green: 242, blue: 242, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        //button.backgroundColor = UIColor.clear
        
        button.setImage(UIImage(named: items[atIndex].icon)?.scaleImage(scaleSize: 0.9), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.contentHorizontalAlignment = .fill
//        button.contentVerticalAlignment = .fill
//        button.contentScaleFactor = 0.5
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected : UIButton, atIndex: Int) {
        buttonWillSelected.isEnabled = false
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected : UIButton, atIndex: Int) {
        buttonDidSelected.isEnabled = true
        print("button did selected: \(atIndex)")
    }
    
    func menuCollapsed(_ circleMenu: CircleMenu) {
        print(circleMenu)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
