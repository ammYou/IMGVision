//
//  HttpHandler.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation

class HttpHandler: URLSession {
    var session = URLSession.shared
    
    func doRequest(request: URLRequest){
        Debug.log("start HTTP \n \(request)")
        var responseData = Dictionary<String, Any>()
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "jp")
                return
            }
            //print(data,responseData,error as Any)
            jsonParser(data)
            
        }
        task.resume()
    }
}
