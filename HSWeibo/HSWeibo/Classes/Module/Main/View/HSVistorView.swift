//
//  HSVistorView.swift
//  HSWeibo
//
//  Created by 曾海胜 on 15/10/27.
//  Copyright © 2015年 zhs. All rights reserved.
//

import UIKit

///定义按钮点击代理
protocol HSVistorViewDelegate: NSObjectProtocol{
    ///注册事件代理方法
    func vistorViewRegister()
    
    ///登录事件代理方法
    func vistorViewLogin()
}

///访客视图类
class HSVistorView: UIView {
    
    ///代理对象
    weak var vistorViewDelegate: HSVistorViewDelegate?

    ///重写构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置UI
        self.setupUI()
    }

    ///一旦重写构造方法就要重写此方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///设置访客视图UI的方法
    private func setupUI(){
        //设置vistorView背景颜色
        self.backgroundColor = UIColor(white: 237 / 255, alpha: 1)
        
        //添加子控件
        self.addSubview(self.iconView)       //转轮视图
        self.addSubview(self.coverView)      //遮罩视图
        self.addSubview(self.homeView)       //房子视图
        self.addSubview(self.messageLabel)   //消息label
        self.addSubview(self.registerButton) //注册按钮
        self.addSubview(self.loginButton)    //登录按钮
        
        //取消自动布局
        self.iconView.translatesAutoresizingMaskIntoConstraints = false
        self.coverView.translatesAutoresizingMaskIntoConstraints = false
        self.homeView.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        //设置遮罩视图约束
        
        //宽
        self.addConstraint(NSLayoutConstraint(item: self.coverView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        
        //顶部
        self.addConstraint(NSLayoutConstraint(item: self.coverView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        //底部
        self.addConstraint(NSLayoutConstraint(item: self.coverView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.registerButton, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
    }
    
    /**
     设置访客视图内容的方法
     
     - parameter imageName: 图片名称
     - parameter message:   消息
     */
    func setupInfo(imageName: String, message: String){
        self.iconView.image = UIImage(named: imageName)  //设置图片
        self.messageLabel.text = message                 //设置消息
        self.messageLabel.sizeToFit()                    //消息宽度自适应
        self.homeView.hidden = true                      //隐藏房子
        self.sendSubviewToBack(self.coverView)           //将遮罩放到最底层
    }
    
    ///开始旋转动画的方法
    func startRotationAnimation(){
        //创建核心动画，动画行为是旋转
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI            //旋转360度
        animation.duration = 20                 //20秒完成一次动画
        animation.repeatCount = MAXFLOAT        //动画执行次数为无限次
        
        //要加上这句,不然切换到其他tabBar或者退出到桌面在切回来动画就停止了
        animation.removedOnCompletion = false
        
        //添加动画到首页的转轮
        self.iconView.layer.addAnimation(animation, forKey: "homeRotation")
    }
    
    /// 暂停旋转
    func pauseAnimation() {
        // 记录暂停时间
        let pauseTime = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        
        // 设置动画速度为0
        iconView.layer.speed = 0
        
        // 设置动画偏移时间
        iconView.layer.timeOffset = pauseTime
    }
    
    /// 恢复旋转
    func resumeAnimation() {
        // 获取暂停时间
        let pauseTime = iconView.layer.timeOffset
        
        // 设置动画速度为1
        iconView.layer.speed = 1
        
        iconView.layer.timeOffset = 0
        
        iconView.layer.beginTime = 0
        
        let timeSincePause = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime
        
        iconView.layer.beginTime = timeSincePause
    }
    
    //MARK: -点击事件
    ///注册按钮点击事件
    func vistorViewRegister(){
        self.vistorViewDelegate?.vistorViewRegister() //通过代理传递事件
    }
    
    ///登录按钮点击事件
    func vistorViewLogin(){
        self.vistorViewDelegate?.vistorViewLogin()    //通过代理传递事件
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
        label.text = "关注一些人,看看有什么惊喜。"
        
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
        
        //添加点击事件
        button.addTarget(self, action: "vistorViewRegister", forControlEvents: UIControlEvents.TouchUpInside)
        
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
        
        //添加点击事件
        button.addTarget(self, action: "vistorViewLogin", forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    
    ///遮罩图片视图
    private lazy var coverView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        
        return imageView
        
    }()
    
}
