//
//  File.swift
//  weibo_v1.0
//
//  Created by Xiangrui Li on 2021/2/22.
//  Copyright © 2021 Xiangrui Li. All rights reserved.
//

import Foundation

var flag = true

func NJLog(_ Message: String, _ FileName: String = #file, _ MethodName: String = #function, _ Line: Int = #line) {
    if flag {
        print("\((FileName as NSString).pathComponents.last!).\(MethodName).\(Line) : \(Message)")
    }
}
