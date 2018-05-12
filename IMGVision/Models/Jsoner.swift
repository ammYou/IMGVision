//
//  Jsoner.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation
import SwiftyJSON

func jsonParser(_ datas: Data)->JSON{
    let json = JSON(datas)
    let errorObj: JSON = json["error"]
    
    return json
}
