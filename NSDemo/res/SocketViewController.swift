//
//  SocketViewController.swift
//  NSDemo
//
//  Created by 老王 on 2018/12/18.
//  Copyright © 2018 王业发. All rights reserved.
//

import Cocoa

import CocoaAsyncSocket

class SocketViewController: NSViewController, GCDAsyncSocketDelegate {

    
    
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
            try socketClient.connect(toHost: "127.0.0.1", onPort: 3333)
        } catch  {
            print("error")
        }
        testButton()
    }
    
    func testButton() {
        let button = NSButton(title: "Click me", target: self, action: #selector(testConnection))
        button.frame = CGRect(x: 0, y: 30, width: 100, height: 50)
        view.addSubview(button)
    }
    
    @objc func testConnection() {
        let msg = "Anybody there?"
        let data = msg.data(using: String.Encoding.utf8)
        let defaultData = Data()
        socketClient.write(data ?? defaultData, withTimeout: -1, tag: 0)
        socketClient.readData(withTimeout: -1, tag: 0)
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
    
}
