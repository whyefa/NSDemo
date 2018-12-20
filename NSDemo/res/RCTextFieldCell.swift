//
//  RCTextFieldCell.swift
//  NSDemo
//
//  Created by 老王 on 2018/12/18.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

class RCTextFieldCell: NSTextFieldCell {
    
    
    
    func setup() {
       //自定义设置(重写init方法中调用该方法)
    }

    override func setUpFieldEditorAttributes(_ textObj: NSText) -> NSText {
        let text = super.setUpFieldEditorAttributes(textObj) as! NSTextView
        text.insertionPointColor = NSColor.orange
        return text
    }
}
