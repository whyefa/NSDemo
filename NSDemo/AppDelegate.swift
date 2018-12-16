//
//  AppDelegate.swift
//  NSDemo
//
//  Created by 王业发 on 2018/12/16.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.window.contentViewController = RootViewController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

