//
//  RootViewController.swift
//  NSDemo
//
//  Created by 王业发 on 2018/12/16.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa



extension NSTextField {
    public class func label(frame frameRect: NSRect) -> NSTextField {
        let label = NSTextField(frame: frameRect)
        label.isEditable = false  ///是否可编辑
        label.isBordered = false  ///是否显示边框
        return label
    }
}

class RootViewController: NSViewController, NSTextFieldDelegate {
    var button: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton()
        testTextField()
    }
    
    func testTextField() {
//        let textField = RCTextField(frame: CGRect(x: 20, y: 20, width: width()-40, height: 100))
//        textField.textColor = NSColor.white
//        textField.isBezeled = true
//        textField.bezelStyle = NSTextField.BezelStyle.squareBezel
//        textField.placeholderString = "请输入文字"
//        textField.font = NSFont(name: "Marker Felt", size: 20)
//        textField.delegate = self
//        view.addSubview(textField)
        
        let textField2 = NSTextField(frame: CGRect(x: 20, y: 140, width: width()-40, height: 25))
        textField2.tag = 1000
        textField2.textColor = NSColor.white
        textField2.isBezeled = true
        textField2.bezelStyle = NSTextField.BezelStyle.squareBezel
//        textField2.isEditable = false
        textField2.placeholderString = "请输入文字"
        textField2.stringValue = "Hello world!"
        textField2.isSelectable = true
        textField2.font = NSFont(name: "Marker Felt", size: 20)
        textField2.delegate = self
//        textField2.maximumNumberOfLines = 2  // 最大显示文字行数
//        textField2.focusRingType = NSFocusRingType.none //编辑状态下,外边框的样式
//        textField2.nextKeyView = button //点击tab获取焦点的下一个textFiled, 当然也可以是别的View
//        textField2.cell?.lineBreakMode = NSLineBreakMode.byCharWrapping //设置断行模式
//        textField2.cell?.truncatesLastVisibleLine = true //设置超出行数是否隐藏
        textField2.cell?.usesSingleLineMode = true
        view.addSubview(textField2)


    }
    
    func controlTextDidChange(_ obj: Notification) {
        print(obj)
    }
    
    func controlTextDidEndEditing(_ obj: Notification) {
        print(obj)
    }
    
    func controlTextDidBeginEditing(_ obj: Notification) {
        print(obj)
    }
    
    func testButton() {
        button = NSButton(title: "确定", target: self, action: #selector(buttonClicked))
        button.frame = CGRect(x: 20, y: 20, width: 100, height: 40)
        view.addSubview(button)
    }
    
    @objc func buttonClicked() {
        let tf = view.viewWithTag(1000)
        self.view.window?.makeFirstResponder(nil)
        
    }
    

    
    func testLabel() {
        let textField = NSTextField(frame: CGRect(x: 0, y: 0, width: width(), height: 100))
        textField.isEditable = false  ///是否可编辑
        textField.isBordered = false  ///是否显示边框
        textField.backgroundColor = NSColor.orange ///背景色
        textField.textColor = NSColor.white
        textField.alignment = NSTextAlignment.left
        
        textField.maximumNumberOfLines = 0
        textField.stringValue = "Hello, how are you? I am fine. Thank you! Bye-bye."
        textField.font = NSFont(name: "Marker Felt", size: 30)
        view.addSubview(textField)
        
        let label = NSTextField.label(frame: CGRect(x: 0, y: 100, width: width(), height: 40))
        label.stringValue = "This is a Label"
        view.addSubview(label)
    }
    
    func width() -> Int {
        return Int(view.frame.width)
    }
    
    
    func testView() {
        let width = view.frame.width
        let view1 = NSView(frame: NSRect(x: 0, y: 0, width: width, height: 50))
        /// 这句必须的,不然看不到layer
        view1.wantsLayer = true
        /// 设置layer的背景色, view是没有backgroundColor这个属性的
        view1.layer?.backgroundColor = NSColor.orange.cgColor
        view.addSubview(view1)
    }
}
