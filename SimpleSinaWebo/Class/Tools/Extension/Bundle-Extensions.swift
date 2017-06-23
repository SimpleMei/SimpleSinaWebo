//
//  Bundle-Extensions.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/6/23.
//  Copyright © 2017年 simple. All rights reserved.
//

import Foundation

extension Bundle {
    
    var namespace:String {
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
        
    }
    
}
