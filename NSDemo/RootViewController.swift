//
//  RootViewController.swift
//  NSDemo
//
//  Created by 王业发 on 2018/12/16.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

import CocoaAsyncSocket

extension NSTextField {
    public class func label(frame frameRect: NSRect) -> NSTextField {
        let label = NSTextField(frame: frameRect)
        label.isEditable = false  ///是否可编辑
        label.isBordered = false  ///是否显示边框
        return label
    }
}

class RootViewController: NSViewController, GCDAsyncSocketDelegate {
    var socketClient: GCDAsyncSocket!
    lazy var socketQueue: DispatchQueue = {
        let defaultQueue = DispatchQueue(label: "socket")
        return defaultQueue
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socketClient = GCDAsyncSocket(delegate: self, delegateQueue: socketQueue)
        socketClient.delegate = self
        do {
            try socketClient.connect(toHost: "127.0.0.1", onPort: 12345)
        } catch  {
            print("error")
        }
        testButton()
    }
    
    func socket(_ sock: GCDAsyncSocket, didConnectTo url: URL) {
        print(url)
    }
    
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {

    }
    
    func socket(_ sock: GCDAsyncSocket, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let res = String(data: data, encoding: String.Encoding.utf8)
        print(res!)
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print(err ?? "did disconnect")
        sock.delegate = nil
    }
    
    func testButton() {
        let button = NSButton(title: "Click me", target: self, action: #selector(testConnection))
        button.frame = CGRect(x: 0, y: 30, width: 100, height: 50)
        view.addSubview(button)
    }
    
    @objc func testConnection() {
        let msg = "Hello, nice to meet you!"
        let data = msg.data(using: String.Encoding.utf8)
        let defaultData = Data()
        socketClient.write(data ?? defaultData, withTimeout: -1, tag: 0)
        socketClient.readData(withTimeout: -1, tag: 0)
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
