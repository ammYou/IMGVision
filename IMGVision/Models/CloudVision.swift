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


func makeCloudVisionRequest(image: UIImage) -> URLRequest{
    Debug.log("start posting")
    let httpManager = HttpHandler()
    let binaryImagedata = base64EncodeImage(image)
    let request = createCloudVisionRequest(with: binaryImagedata)
    //let response = httpManager.doRequest(request: request)
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
    let cout = 1
    // Build our API request
    let jsonRequest = [
        "requests": [
            "image": [
                "content": binaryImage
            ],
            "features": [
                ["type": "FACE_DETECTION",
                 "maxResults": cout],
                ["type": "LANDMARK_DETECTION",
                 "maxResults": cout],
                ["type": "LOGO_DETECTION",
                 "maxResults": cout],
                ["type": "LABEL_DETECTION",
                 "maxResults": cout],
                ["type": "TEXT_DETECTION",
                 "maxResults": cout],
                ["type": "SAFE_SEARCH_DETECTION",
                 "maxResults": cout],
                ["type": "IMAGE_PROPERTIES",
                 "maxResults": cout],
                ["type": "WEB_DETECTION",
                 "maxResults": cout],
                ["type": "DOCUMENT_TEXT_DETECTION",
                 "maxResults": cout],
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
