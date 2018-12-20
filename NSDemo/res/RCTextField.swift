//
//  RCTextField.swift
//  NSDemo
//
//  Created by 老王 on 2018/12/18.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

class RCTextField: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    
    
    
    
    override func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        print(notification)
    }
    
    override func textDidEndEditing(_ notification: Notification) {
        super.textDidEndEditing(notification)
        print(notification)
    }
    
    override func textDidBeginEditing(_ notification: Notification) {
        super.textDidBeginEditing(notification)
        print(notification)
    }
    
    override func textShouldBeginEditing(_ textObject: NSText) -> Bool {
        return true
    }
    
    override func textShouldEndEditing(_ textObject: NSText) -> Bool {
        return true
    }
    
}
