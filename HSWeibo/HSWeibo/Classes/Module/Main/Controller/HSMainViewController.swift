//
//  HSMainViewController.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

class HSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor.orangeColor()
        
        let homeVC = HSHomeTableViewController()
        self.addChildViewController(homeVC, title: "首页", imageName: "tabbar_home")
        
        let messageVC = HSMessageTableViewController()
        self.addChildViewController(messageVC, title: "消息", imageName: "tabbar_message_center")
        
        let discoverVC = HSDiscoverTableViewController()
        self.addChildViewController(discoverVC, title: "发现", imageName: "tabbar_discover")
        
        let profileVC = HSProfileTableViewController()
        self.addChildViewController(profileVC, title: "我", imageName: "tabbar_profile")
        
    }
    
    /**
     tabBar添加子控制器，包装nav导航控制器
     
     - parameter controller: 子控制器
     - parameter title:      标题
     - parameter imageName:  tabBarItem图片名称
     */
    private func addChildViewController(controller: UIViewController,title: String,imageName: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        self.addChildViewController(UINavigationController(rootViewController: controller))
    }
}
