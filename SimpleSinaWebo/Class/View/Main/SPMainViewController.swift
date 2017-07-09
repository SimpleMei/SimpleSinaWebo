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
        setupComposeButton()
        
        
    }
   fileprivate lazy var composeButton : UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")

   @objc fileprivate func composeStatus () {
        
        print("撰写微博")
        
    }

}

//设置界面
extension SPMainViewController {
    
    fileprivate func setupComposeButton () {
        
        tabBar.addSubview(composeButton)
        
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    
    fileprivate func setupChildController() {
        
        let array = [["clsName":"SPHomeViewController","title":"首页","imageName":"home"],
                     ["clsName":"SPMessageViewController","title":"消息","imageName":"message_center"],
                     ["clsName":"UIViewController"],
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
        //反射机制创建控制器
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
