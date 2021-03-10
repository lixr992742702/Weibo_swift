//
//  UIButton+Extension.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/2/23.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import UIKit

extension UIButton {
    /*
    如果构造方法前面没有convenience单词, 代表着是一个初始化构造方法(指定构造方法)
    如果构造方法前面有convenience单词, 代表着是一个便利构造方法
    指定构造方法和便利构造方法的区别
    指定构造方法中必须对所有的属性进行初始化
    便利构造方法中不用对所有的属性进行初始, "因为便利构造方法依赖于指定构造方法"
    一般情况下如果想给系统的类提供一个快速创建的方法, 就自定义一个便利构造方法
    */
    convenience init(_ ImageName: String, _ BackgroundImageName: String) {
        
        // 0.自初始化， covenience init必须
        self.init()
        // 1.设置前景图片
        setImage(UIImage(named: ImageName), for: UIControl.State.normal)
        setImage(UIImage(named: ImageName+"_highlighted"), for: UIControl.State.highlighted)
        // 2.设置背景图片
        setBackgroundImage(UIImage(named: BackgroundImageName), for: UIControl.State.normal)
        setBackgroundImage(UIImage(named: BackgroundImageName+"_highlighted"), for: UIControl.State.highlighted)
        // 3.调整按钮尺寸
        sizeToFit()
        
        
    }
}
