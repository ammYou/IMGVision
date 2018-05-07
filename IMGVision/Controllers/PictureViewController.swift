//
//  PictureViewController.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/01.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    let photoLibraryViewController = ImageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.color(29, green: 148, blue: 79, alpha: 1.0)
        self.view.addSubview(photoLibraryViewController.view)
        self.photoLibraryViewController.modalPresentationStyle = .currentContext
        //view.addSubview(photoLibraryView.view)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        photoLibraryViewController.openPhotoLibraryView()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
