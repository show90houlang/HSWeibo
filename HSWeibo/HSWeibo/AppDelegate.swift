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
        let tabBar = HSMainViewController()
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()

        return true
    }

}

