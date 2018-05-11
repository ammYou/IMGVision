//
//  Log.swift
//  IMGVision
//
//  Created by AmamiYou on 2018/05/12.
//  Copyright © 2018年 AmamiYou. All rights reserved.
//

import Foundation

class Debug: NSObject {
    
    class func log(_ obj: Any?,
                   file: String = #file,
                   line: Int = #line,
                   function: String = #function
        ) {
        #if DEBUG
        var filename = file
        if let match = filename.range(of: "[^/]*$", options: .regularExpression) {
            filename = filename.substring(with: match)
        }
        if let obj = obj {
            print("[File:\(filename)][Line:\(line)][Function:\(function)] : \(obj)")
        } else {
            print("[File:\(filename)][Line:\(line)][Function:\(function)]")
        }
        #endif
    }
    
}
