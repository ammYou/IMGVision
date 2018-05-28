//
//  Jsoner.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/11.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation
import SwiftyJSON

func jsonParser(_ datas: Data)->Annonate {
    let annonate = try? JSONDecoder().decode(Annonate.self, from: datas)
    print(annonate!.responses![0].webDetection!.fullMatchingImages![0])
    return annonate!
}
