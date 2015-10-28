//
//  HSBaseTableViewController.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

class HSBaseTableViewController: UITableViewController {

    //用户登录状态
    let userLogin = false
    
    //当实现这个方法,并且给view设置值,不会再从其他地方加载view.xib storyboard,子类加载的时候会调用此方法初始化视图
    //如果当前是登录状态:view = tableView(显示默认的视图)
    //如果当前是访客状态:view = HSVistorView(显示访客视图)
    override func loadView() {
        super.loadView()
        
        self.userLogin ? super.loadView() : self.setupVisitorView()
    }
    
    ///创建访客视图的方法
    private func setupVisitorView(){
        let vistorView = HSVistorView()  //创建访客视图
        self.view = vistorView           //将当前控制器显示的视图替换为访客视图
        
        //根据面向对象的多态性，在父控制器中判断当前加载的是哪个控制器，设置不同的访客内容
        if self is HSHomeTableViewController{
            //开始旋转转轮动画
            vistorView.startRotationAnimation()
            
            //添加通知，应用进入后台就停止动画
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEnterBackgroud", name: UIApplicationDidEnterBackgroundNotification, object: nil)
            
            //添加通知，应用进入前台就开始动画
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
            
        } else if self is HSMessageTableViewController{
            vistorView.setupInfo("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        } else if self is HSDiscoverTableViewController{
            vistorView.setupInfo("visitordiscover_image_message", message: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
        } else if self is HSProfileTableViewController{
            vistorView.setupInfo("visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        }
        
        vistorView.vistorViewDelegate = self //设置代理
        
        //添加导航栏按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
    }
    
    // MARK: -监听方法
    ///应用进入后台
    private func didEnterBackgroud(){
        (self.view as! HSVistorView).pauseAnimation() //暂停动画
    }
    
    ///应用进入前台
    private func didBecomeActive(){
        (self.view as! HSVistorView).resumeAnimation()//继续动画
    }
    
}

// MARK: - 扩展 HSBaseTableViewController 实现 HSVistorViewDelegte 协议
//相当于 category, 方便代码的管理
extension HSBaseTableViewController: HSVistorViewDelegate{
    func vistorViewRegister() {
        
    }
    
    func vistorViewLogin() {
        let oauthController = HSOauthViewController()
        self.presentViewController(UINavigationController(rootViewController: oauthController), animated: true, completion: nil)
    }
}
