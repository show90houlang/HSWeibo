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
    
    //当实现这个方法,并且给view设置值,不会再从其他地方加载view.xib storyboard,子类加载的时候会调用此方法
    //如果当前是登录状态:view = tableView(显示默认的视图)
    //如果当前是访客状态:view = HSVistorView(显示访客视图)
    override func loadView() {
        super.loadView()
        
        self.userLogin ? super.loadView() : self.setupVisitorView()
    }
    
    ///创建访客视图的方法
    func setupVisitorView(){
        self.view = HSVistorView()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
}
