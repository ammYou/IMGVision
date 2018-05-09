//
//  PictureViewController.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/01.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var rootViewController:UIViewController?
    var viewFlag = false
    //変数の宣言
    var imageView:UIImageView!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.color(29, green: 148, blue: 79, alpha: 1.0)
        //UIImageViewの設定
        imageView = UIImageView()
        imageView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        //delegateを設定
        imagePicker.delegate = self
        //viewに追加
        self.view.addSubview(imageView)
        self.viewFlag = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.viewFlag {
            openPhotoLibraryView()
            viewFlag = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.viewFlag = true
    }

    
    func openPhotoLibraryView() {
        imagePicker.setEditing(true, animated: true)
        imagePicker.preferredContentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        //写真選択後の修正をOFFにする
        imagePicker.allowsEditing = true
        //写真ライブラリを開く設定(カメラを起動することも可)
        imagePicker.sourceType = .photoLibrary
        //写真ライブラリを開く
        present(imagePicker,animated: true,completion: nil)
        self.viewFlag = false
    }
    

    //写真が選択された時の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.viewFlag = false
        //選択された画像を保存
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //比率を変えずに画像を表示する(空白が生じる)
            imageView.contentMode = .scaleAspectFit
            //画像を設定
            imageView.image = image
        }
        //写真ライブラリを閉じる
        picker.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //キャンセルが押された時の処理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.viewFlag = false
        
        //写真ライブラリを閉じる
        picker.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        
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
