//
//  VisitorView.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/2/24.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    /// 注册按钮
    @IBOutlet weak var registerButton: UIButton!
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    /// 转盘
    @IBOutlet weak var rotationImageView: UIImageView!
    /// 图标
    @IBOutlet weak var iconImageView: UIImageView!
    /// 文本标签
    @IBOutlet weak var titleLabel: UILabel!
        /// 代理
        // 和OC一样代理属性必须使用weak修饰
    //    weak var delegate: VisitorViewDelegate?
        
        /// 设置访客视图上的数据
        /// imageName需要显示的图标
        /// title需要显示的标题
    
    func setupVisitorInfo(imageName: String? , title: String) {
        // 1.设置标题
        titleLabel.text = title
        
        // 2.判断是否是首页
        guard let name = imageName else
        {
            // 没有设置图标, 首页
            // 执行转盘动画
            startAniamtion()
            
            return
        }
        
        // 3.设置其他数据
        // 不是首页
        rotationImageView.isHidden = true
        
        iconImageView.image = UIImage(named: name)
    }
    
    /// 转盘旋转动画
    private func startAniamtion(){
        // 1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 5.0
        anim.repeatCount = MAXFLOAT
        
        
        // 注意: 默认情况下只要视图消失, 系统就会自动移除动画
        // 只要设置isRemovedOnCompletion为false, 系统就不会移除动画
        anim.isRemovedOnCompletion = false
        
        // 3.将动画添加到图层上
        rotationImageView.layer.add(anim, forKey: nil)
        
        
        
    }
    
    
    
    
    
    
    class func visitorView() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.last as! VisitorView
    }

}
