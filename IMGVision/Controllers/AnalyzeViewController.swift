//
//  AnalyzeViewController.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit
import SwiftyJSON

class AnalyzeViewController: UIViewController {
    var testLabel = UILabel()
    var datas:Annonate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        testLabel.backgroundColor = UIColor.lightGray
        self.view.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        sleep(2)
        print(datas)
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
