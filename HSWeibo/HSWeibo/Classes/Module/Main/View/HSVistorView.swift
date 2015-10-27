//
//  HSVistorView.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

///访客视图类
class HSVistorView: UIView {

    //重写构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置UI
        self.setupUI()
    }

    //一旦重写构造方法就要重写此方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///设置UI的方法
    private func setupUI(){
        //添加子控件
        self.addSubview(self.iconView)
        self.addSubview(self.homeView)
        self.addSubview(self.messageLabel)
        self.addSubview(self.registerButton)
        self.addSubview(self.loginButton)
        
        //取消自动布局
        self.iconView.translatesAutoresizingMaskIntoConstraints = false;
        self.homeView.translatesAutoresizingMaskIntoConstraints = false;
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false;
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false;
        
        // 创建约束
        // 约束公式：view1.constraint = view2.constraint * multiplier + constant
        //设置转轮约束
        //CenterX
        self.addConstraint(NSLayoutConstraint(item: self.iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        //CenterY
        self.addConstraint(NSLayoutConstraint(item: self.iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -40))
        
        //设置小房子约束
        //CenterX
        self.addConstraint(NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        //CenterY
        self.addConstraint(NSLayoutConstraint(item: self.homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        //设置消息label约束
        //X
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        //Y
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        //width
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))
        
        //设置注册按钮约束
        //左边
        self.addConstraint(NSLayoutConstraint(item: self.registerButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        
        //顶部
        self.addConstraint(NSLayoutConstraint(item: self.registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        //宽度
        self.addConstraint(NSLayoutConstraint(item: self.registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        //高度
        self.addConstraint(NSLayoutConstraint(item: self.registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        
        //设置登录按钮约束
        //右边
        self.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.messageLabel, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        
        //顶部
        self.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        //宽度
        self.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        //高度
        self.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        
    }
    
    //MARK: -懒加载
    ///转轮
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        
        //设置图片
        imageView.image = UIImage(named: "visitordiscover_feed_image_smallicon")
        
        //根据图片大小自动设置图片视图大小
        imageView.sizeToFit()
        
        return imageView
    }()
    
    ///小房子,只有首页有
    private lazy var homeView: UIImageView = {
        let imageView = UIImageView()
        
        //设置图片
        imageView.image = UIImage(named: "visitordiscover_feed_image_house")
        
        //根据图片大小自动设置图片视图大小
        imageView.sizeToFit()
        
        return imageView
    }()
    
    ///消息文字
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        
        //设置文字
        label.text = "关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜"
        
        //设置文字颜色
        label.textColor = UIColor.lightGrayColor()
        
        //设置换行
        label.numberOfLines = 0
        
        //根据文字的宽度自动设置label宽度
        label.sizeToFit()
        
        return label
    }()
    
    ///注册按钮
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        
        //设置文字
        button.setTitle("注册", forState: UIControlState.Normal)
        
        //设置文字颜色
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        //根据文字的宽度自动设置button大小
        button.sizeToFit()
        
        return button
    }()
    
    ///登录按钮
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        //设置文字
        button.setTitle("登录", forState: UIControlState.Normal)
        
        //设置文字颜色
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        //根据文字的宽度自动设置button大小
        button.sizeToFit()
        
        return button
    }()
    
    
}
