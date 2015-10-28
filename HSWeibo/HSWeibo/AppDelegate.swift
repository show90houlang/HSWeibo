//
//  AppDelegate.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //创建window对象
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //创建主视图控制器（tabBarController）
        let tabBar = HSMainViewController()
        
        //设置window根控制器为主视图控制器（tabBarController）
        self.window?.rootViewController = tabBar
        
        //设为主窗口并显示
        self.window?.makeKeyAndVisible()

        return true
    }
    
    ///设置全局导航栏样式
    private func setupAppearance(){
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
    }

}

