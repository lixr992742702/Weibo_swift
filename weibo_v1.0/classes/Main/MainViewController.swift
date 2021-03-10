//
//  MainViewController.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/2/22.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor=UIColor.orange
        //self.tabBar.barTintColor = UIColor.orange


        //1.添加子控制器
        //addchildController()
        
    }
    
    //当view出现时就会有的操作
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.addSubview(composeButton)
        
        // 保存按钮尺寸
        let rect = composeButton.frame
        // 计算宽度
        let width = tabBar.bounds.width / CGFloat(children.count)
        // 设置按钮的位置
        composeButton.frame = CGRect(x: 2 * width, y: 0, width: width, height: rect.height)
        //        composeButton.frame = CGRectOffset(rect, 2 * width, 0)
        
        
        
    }
    
    //添加子控制器
    /*func addchildController() {
        
        // 1.根据JSON文件创建控制器
        // 1.1读取JSON数据
        guard  let filepath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
            NJLog("JSON文件不存在")
            return
        }
        
        guard let data = NSData(contentsOfFile: filepath) else {
            NJLog("加载二进制数据失败")
            return
        }
        
        // 1.2将JSON数据转换为对象(数组字典)
        
        do {
            let objc = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: AnyObject]]
            
            // 1.3遍历数组字典取出每一个字典
            for dict in objc
            {
                // 1.4根据遍历到的字典创建控制器
                let title = dict["title"] as? String
                let vcName = dict["vcName"] as? String
                let imageName = dict["imageName"] as? String
                addChild(vcName,title,imageName)
            }
        } catch  {
                addChild("HomeTableViewController","首页", "tabbar_home")
                addChild("MessageTableViewController", "消息", "tabbar_message_center")
                addChild("NullViewController", "添加", "tabbar_compose_icon_add")
                addChild("DiscoverTableViewController",  "发现", "tabbar_discover")
                addChild("ProfileTableViewController", "我",  "tabbar_profile")
        }
        

    }*/
    
    //定义子控制器
    /*func addChild(_ childControllerName: String?, _ title: String?, _ ImageName: String?) {

        // 1.动态获取命名空间
        // 由于字典/数组中只能存储对象, 所以通过一个key从字典中获取值取出来是一个AnyObject类型, 并且如果key写错或者没有对应的值, 那么就取不到值, 所以返回值可能有值也可能没值, 所以最终的类型是AnyObject?
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            NJLog("获取命名空间失败")
            return

        }

        /*
        Swift中新增了一个叫做命名空间的概念
        作用: 避免重复
        不用项目中的命名空间是不一样的, 默认情况下命名空间的名称就是当前项目的名称
        正是因为Swift可以通过命名空间来解决重名的问题, 所以在做Swift开发时尽量使用cocoapods来集成三方框架, 这样可以有效的避免类名重复
        正是因为Swift中有命名空间, 所以通过一个字符串来创建一个类和OC中也不太一样了, OC中可以直接通过类名创建一个类, 而Swift中如果想通过类名来创建一个类必须加上命名空间
        */
        //2.根据字符串获取class
        var cls: AnyClass? = nil
        if let vcName = childControllerName
        {
            cls = NSClassFromString(name + "." + vcName)
        }


        //3.根据class创建对象
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typeCls = cls as? UITableViewController.Type else
        {
            NJLog("cls不能当做UITableViewController")
            return
        }

        // 3.1通过Class创建对象
        let childController = typeCls.init()
       // NJLog(childController)

        //3.2设置子控制的相关属性
        //childController.navigationItem.title = title
        //childController.tabBarItem.title = title
        childController.title = title
        if let ivName = ImageName
        {
            childController.tabBarItem.image = UIImage(named: ivName)
            childController.tabBarItem.selectedImage = UIImage(named: ivName + "_highlighted")
        }

        //3.3 包装一个导航控制器
        let nav = UINavigationController(rootViewController: childController)
        //1.3将子控制器添加到UITabBarController
        addChild(nav)
    }*/
    
    
    /*
    public : 最大权限, 可以在当前framework和其他framework中访问
    internal : 默认的权限, 可以在当前framework中随意访问
    private : 私有权限, 只能在当前文件中访问
    以上权限可以修饰属性/方法/类
    
    在企业开发中建议严格的控制权限, 不想让别人访问的东西一定要private
    */
    // 如果给按钮的监听方法加上private就会报错, 报错原因是因为监听事件是由运行循环触发的, 而如果该方法是私有的只能在当前类中访问
    // 而相同的情况在OC中是没有问题, 因为OC是动态派发的
    // 而Swift不一样, Swift中所有的东西都在是编译时确定的
    // 如果想让Swift中的方法也支持动态派发, 可以在方法前面加上 @objc
    // 加上 @objc就代表告诉系统需要动态派发
    
    @objc private func compseBtnClick(btn: UIButton)
    {

        NJLog("composebtn")
    }

    //MARK: -懒加载：composebutton， 加号按钮
    private lazy var composeButton: UIButton = {
        () -> UIButton
        in


        // 1.创建按钮
        let btn = UIButton("tabbar_compose_icon_add", "tabbar_compose_button")
        // 2.监听按钮点击
        btn.addTarget(self, action: #selector(compseBtnClick), for: UIControl.Event.touchUpInside)

        return btn
    }()


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
