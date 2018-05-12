//
//  CloudVision.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


func postCloudVision(image: UIImage) -> URLRequest{
    Debug.log("start posting")
    let httpManager = HttpHandler()
    let binaryImagedata = base64EncodeImage(image)
    let request = createCloudVisionRequest(with: binaryImagedata)
    let response = httpManager.doRequest(request: request)
    Debug.log("finish posting")
    return request
    
}

func createCloudVisionRequest(with binaryImage: String)->URLRequest{
    var googleAPIKey = ""
    var googleURL: URL {
        return URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleAPIKey)")!
    }
    var request = URLRequest(url: googleURL)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
    
    // Build our API request
    let jsonRequest = [
        "requests": [
            "image": [
                "content": binaryImage
            ],
            "features": [
                [
                    "type": "LABEL_DETECTION",
                    "maxResults": 10
                ],
                [
                    "type": "FACE_DETECTION",
                    "maxResults": 10
                ]
            ]
        ]
    ]
    
    let jsonObject = JSON(jsonRequest)
    guard let data = try? jsonObject.rawData() else {
        return URLRequest(url: URL(string: "")!)
    }
    request.httpBody = data
    return request
}
