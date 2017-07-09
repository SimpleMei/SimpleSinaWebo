//
//  SPBaseViewController.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/6/22.
//  Copyright © 2017年 simple. All rights reserved.
//

import UIKit

class SPBaseViewController: UIViewController {

    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    lazy var naviItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI();
    

    }

    override var title: String? {
        didSet {
            
            naviItem.title = title;
            
        }
        
    }
    
}

extension SPBaseViewController {
    
    
    open func setupUI()
    {
        view.backgroundColor = UIColor.cz_random()
        view.addSubview(navigationBar)
        navigationBar.items = [naviItem]
        
        //导航渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        //导航字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
    }
    
}
