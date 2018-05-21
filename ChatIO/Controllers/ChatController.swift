//
//  ChatController.swift
//  ChatIO
//
//  Created by Eduardo dos santos on 19/05/2018.
//  Copyright © 2018 Eduardo dos santos. All rights reserved.
//

import UIKit
import SocketIO

class ChatController: UIViewController {

    var textFieldChat : UITextField!
    var labelChat : UITextView!
    var labelRoom : UILabel!
    let gradientLayer = CAGradientLayer()
    var timer : Timer?
    var lastStatus : Int!
    var manager : SocketManager!
    var socket:SocketIOClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.manager = SocketManager(socketURL: URL(string: "\(Variables.server!)")!, config: [.log(true), .compress])
        
        self.socket = manager.defaultSocket
        
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.printStatus), userInfo: nil, repeats: true)
        
        self.socketListen()
        
        self.manager.connect()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initLayout()
    }
    
    //List call listen
    func socketListen() {
        
        socket?.on(clientEvent: .connect) {data, ack in
            print("Test: Connect")
            self.socket?.emit("name",Variables.userName);
        }
        
        socket?.on(clientEvent: .error) {data, ack in
            print("Test: Error")
            print(data)
        }
        
        socket?.on(clientEvent: .disconnect) {data, ack in
            print("Test: Disconnect")
            print(data)
        }
        
        socket?.on(clientEvent: .statusChange) {data, ack in
            print("Test: statusChange")
            print(data)
        }
        
        socket?.on(clientEvent: .reconnect) {data, ack in
            print("Test: reconnect")
            print(data)
        }
        
        socket?.on("connect") {data, ack in
            print("Test: connect")
            print(data)
        }
        
        socket?.on("users") {data, ack in
            print("Test: users")
            self.labelRoom.text = "\(data[0]) Usuário(s) Online"
        }
        
        socket?.on("chatResponse") {data, ack in
            print("chatResponse \(data)")
            self.labelChat.text = "\(String(describing: self.labelChat.text!)) \n\(data[0])"
                .replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        }
        
        /*socket?.onAny({data in
            print("Any event =====> \(data)" )
        })*/
        
    }
    
    @objc func printStatus() {
        if(self.socket!.status.rawValue != self.lastStatus) {
            switch self.socket!.status{
            case .connected:
                self.lastStatus = self.socket!.status.rawValue
                print("status: connected")
            case .connecting:
                self.lastStatus = self.socket!.status.rawValue
                print("status: connecting")
            case .disconnected:
                self.lastStatus = self.socket!.status.rawValue
                print("status: disconnected")
            case .notConnected:
                self.lastStatus = self.socket!.status.rawValue
                print("status: notconnected")
                
            }
        }
    }
    
    //Send message
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("Servidor \(Variables.server!), Usuário \(Variables.userName!) Digitou: \(textField.text!)")
        self.socket?.emit("chat",textField.text!);
        textField.text = ""
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.textFieldChat.frame = CGRect(x: 10, y: Constants.height - 50, width: Constants.width - 20, height: 40)
        })
        
        return true
    }
    
}
