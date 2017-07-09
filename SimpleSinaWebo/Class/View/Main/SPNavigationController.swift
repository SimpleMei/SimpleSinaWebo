//
//  SPNavigationController.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/6/22.
//  Copyright © 2017年 simple. All rights reserved.
//

import UIKit

class SPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationBar.isHidden = true
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //如果不是栈底控制器才需要隐藏
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            //添加返回item
            if let vc = viewController as? SPBaseViewController {
                
                var title = "返回"
                
                if childViewControllers.count == 1 {
                    
                    title = childViewControllers.first?.title ?? "返回"
                    
                }
                
                vc.naviItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack:true)
            }
        }
        
        super.pushViewController(viewController, animated: true)
        
    }
    
    @objc private func popToParent () {
        
        popViewController(animated: true)
        
    }

}
