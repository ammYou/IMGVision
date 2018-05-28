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
    var viewFlag = 0
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
        self.viewFlag = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.viewFlag == 0 {
            self.viewFlag += 1
            openPhotoLibraryView()
        }else if self.viewFlag == 2{
            self.viewFlag -= 1
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.viewFlag -= 1
        self.imageView.image = nil
    }

    
    func openPhotoLibraryView() {
        self.viewFlag += 1
        //写真選択後の修正をOFFにする
        //imagePicker.allowsEditing = true
        //写真ライブラリを開く設定(カメラを起動することも可)
        self.imagePicker.sourceType = .photoLibrary
        //写真ライブラリを開く
        self.present(imagePicker,animated: true,completion: nil)
        
    }
    

    //写真が選択された時の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //選択された画像を保存
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //比率を変えずに画像を表示する(空白が生じる)
            self.imageView.contentMode = .scaleAspectFit
            //画像を設定
            self.imageView.image = image
            DispatchQueue.global().async {self.getData(request: makeCloudVisionRequest(image: image))}
        }
        //写真ライブラリを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    //キャンセルが押された時の処理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //写真ライブラリを閉じる
        picker.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func getData(request: URLRequest){
        var session = URLSession.shared
        Debug.log("start HTTP \n \(request)")
        var responseData = Dictionary<String, Any>(
        )
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "jp")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
                return
            }
            let datas = jsonParser(data)
            DispatchQueue.main.async {
                let new = AnalyzeViewController()
                new.datas = datas
                self.viewFlag += 1
                self.present(new, animated: true, completion: nil)
            }
        }
        task.resume()
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
