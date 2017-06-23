//
//  SPMainViewController.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/6/22.
//  Copyright © 2017年 simple. All rights reserved.
//

import UIKit

class SPMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        setupChildController()
        
    }

}

//设置界面
extension SPMainViewController {
    
    fileprivate func setupChildController() {
        
        let array = [["clsName":"SPHomeViewController","title":"首页","imageName":"home"],
                     ["clsName":"SPMessageViewController","title":"消息","imageName":"message_center"],
                     ["clsName":"SPDiscoverViewController","title":"发现","imageName":"discover"],
                     ["clsName":"SPProfileViewController","title":"我的","imageName":"profile"],
                     ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            
            arrayM.append(controller(dict: dict))
            
        }
        viewControllers = arrayM
    }
    
    private func controller(dict:[String:String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
                  let title = dict["title"],
                  let imageName = dict["imageName"],
                  let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        
            else {
            
                return UIViewController()
                
                
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(imageLiteralResourceName: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "tabbar_" + imageName + "_selected").withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: UIControlState.normal)
        let navi = SPNavigationController(rootViewController: vc)
        return navi
        
    }
    
}
