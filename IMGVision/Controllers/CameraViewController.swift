//
//  CameraViewController.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/01.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let cameraViewController = ImageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.color(253, green: 200, blue: 58, alpha: 1.0)
        self.view.addSubview(cameraViewController.view)
        self.cameraViewController.modalPresentationStyle = .currentContext
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cameraViewController.openCameraView()
        dismiss(animated: true, completion: nil)
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
