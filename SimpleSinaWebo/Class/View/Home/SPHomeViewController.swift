//
//  SPHomeViewController.swift
//  SimpleSinaWebo
//
//  Created by simple on 2017/6/23.
//  Copyright © 2017年 simple. All rights reserved.
//

import UIKit

class SPHomeViewController: SPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @objc fileprivate func showNext () {
        
        
    }


}

extension SPHomeViewController {
    
    override func setupUI() {
        super.setupUI()
        
//        let btn : UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: @selector(showNext), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)

        naviItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showNext))
        
    }
    
}
