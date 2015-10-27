//
//  HSMainViewController.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

class HSMainViewController: UITabBarController {

    ///撰写按钮响应事件
    func composeButtonClick(){
        print(__FUNCTION__)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置选中tabBarButton时的颜色
        self.tabBar.tintColor = UIColor.orangeColor()
        
        //tabBarController添加子控制器，包装nav导航控制器
        //首页
        let homeVC = HSHomeTableViewController()
        self.addChildViewController(homeVC, title: "首页", imageName: "tabbar_home")
        
        //消息
        let messageVC = HSMessageTableViewController()
        self.addChildViewController(messageVC, title: "消息", imageName: "tabbar_message_center")
        
        //撰写按钮（空的，目的是为了在tabBar中腾出一个tabBarButton位置，用来放自定义的撰写按钮）
        let vc = UIViewController()
        self.addChildViewController(vc, title: "", imageName: "f")
        
        let discoverVC = HSDiscoverTableViewController()
        self.addChildViewController(discoverVC, title: "发现", imageName: "tabbar_discover")
        
        let profileVC = HSProfileTableViewController()
        self.addChildViewController(profileVC, title: "我", imageName: "tabbar_profile")
    }
    
    ///视图即将显示的时候调用此方法
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //在此方法中将撰写按钮添加到tabBar中，可以让撰写按钮在tabBar的最上面，避免被tabBarButton遮挡
        self.tabBar.addSubview(self.composeButton)
        let width = self.tabBar.bounds.width / CGFloat(5)
        
        //设置撰写按钮frame，让其显示在tabBar中间
        self.composeButton.frame = CGRect(x: width * 2, y: 0, width: width, height: self.tabBar.bounds.height)
    }
    
    /**
     tabBarController添加子控制器，包装nav导航控制器
     
     - parameter controller: 子控制器
     - parameter title:      标题
     - parameter imageName:  tabBarItem图片名称
     */
    private func addChildViewController(controller: UIViewController,title: String,imageName: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        self.addChildViewController(UINavigationController(rootViewController: controller))
    }
    
    // MARK: -懒加载
    ///撰写按钮
    lazy var composeButton: UIButton = {
        let button = UIButton()
        
        //按钮图片
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        //按钮背景图片
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        //绑定点击事件
        button.addTarget(self, action: "composeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    
}
