//
//  Jsoner.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation
import SwiftyJSON

func jsonParser(_ datas: Data)->Dictionary<String, Any>{
    DispatchQueue.main.async(execute: {
        // Use SwiftyJSON to parse results
        let json = JSON(datas)
        let errorObj: JSON = json["error"]
        print(json)
    })
        
    return Dictionary()
}
