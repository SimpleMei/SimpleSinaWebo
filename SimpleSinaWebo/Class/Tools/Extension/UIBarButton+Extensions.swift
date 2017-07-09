//
//  UIBarButton+Extensions.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/7/9.
//  Copyright © 2017年 simple. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    convenience init(title:String, fontSize:CGFloat = 16,target:AnyObject?, action:Selector, isBack:Bool = false) {
        
        let btn : UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            
            btn.setImage(UIImage(named:imageName), for: .normal)
            btn.setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
            
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        
        
        self.init(customView: btn)
        
    }
    
}
