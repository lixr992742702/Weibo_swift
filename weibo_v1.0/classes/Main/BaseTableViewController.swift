//
//  BaseTableViewController.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/2/24.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    /// 定义标记记录用户登录状态
    var isLogin = true
    
    /// 访客视图
    var visitorView: VisitorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 判断用户是否登录, 如果没有登录就显示访客界面, 如果已经登录就显示tableview
        isLogin ? super.loadView() : setupVisitorView()

    }
    // MARK: - 内部控制方法
    private func setupVisitorView()
    {
//        let otherView = VisitorView.visitorView()
//        view = otherView
        
        // 1.创建访客视图
        visitorView = VisitorView.visitorView()
        view = visitorView
        
        // 2.设置代理
//        visitorView?.delegate = self
        visitorView?.loginButton.addTarget(self, action: #selector(loginBtnClick), for: UIControl.Event.touchUpInside)
        visitorView?.registerButton.addTarget(self, action: #selector(registerBtnClick), for: UIControl.Event.touchUpInside)
        
        // 3.添加导航条按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItem.Style.plain, target: self, action: #selector(registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItem.Style.plain, target: self, action: #selector(loginBtnClick))
    }
    
    @objc private func loginBtnClick(btn: UIButton) {
        NJLog("loginBtnClick")
    }
    
    @objc private func registerBtnClick(btn: UIButton) {
        NJLog("registerBtnClick")
    }
    
    //extension BaseTableViewController: VisitorViewDelegate
    //{
    //    func visitorViewDidClickLoginBtn(visitor: VisitorView)
    //    {
    //        NJLog("")
    //    }
    //    func visitorViewDidClickRegisterBtn(visitor: VisitorView)
    //    {
    //        NJLog("")
    //    }
    //}
}
