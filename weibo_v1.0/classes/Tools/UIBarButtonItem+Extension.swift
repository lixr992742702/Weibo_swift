//
//  UIBarButtonItem+Extension.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/3/3.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, target: AnyObject?, action: Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        btn.setImage(UIImage(named: imageName+"_highlighted"), for: UIControl.State.highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        
        self.init(customView: btn)
    }
}
