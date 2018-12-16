//
//  RootViewController.swift
//  NSDemo
//
//  Created by 王业发 on 2018/12/16.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.width
        let view1 = NSView(frame: NSRect(x: 0, y: 0, width: width, height: 50))
        /// 这句必须的,不然看不到layer
        view1.wantsLayer = true
        /// 设置layer的背景色, view是没有backgroundColor这个属性的
        view1.layer?.backgroundColor = NSColor.orange.cgColor
        view.addSubview(view1)
    }
    
}
