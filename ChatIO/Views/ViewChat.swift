//
//  ViewChat.swift
//  ChatIO
//
//  Created by Eduardo dos santos on 19/05/2018.
//  Copyright © 2018 Eduardo dos santos. All rights reserved.
//

import UIKit

extension ChatController : UITextFieldDelegate {
    
    func initLayout(){
        self.createGradientLayer()
        self.createTextFieldChat()
        self.createLabelChat()
        self.createLabelRoom()
    }
    
    func createGradientLayer() {
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.darkGray.cgColor]
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func createTextFieldChat() {
        
        textFieldChat = UITextField(frame: CGRect(x: 10, y: Constants.height - 50, width: Constants.width - 20, height: 40))
        textFieldChat.placeholder = Constants.chatPlaceholder
        textFieldChat.font = UIFont.systemFont(ofSize: 15)
        textFieldChat.borderStyle = UITextBorderStyle.roundedRect
        textFieldChat.autocorrectionType = UITextAutocorrectionType.no
        textFieldChat.keyboardType = UIKeyboardType.default
        textFieldChat.returnKeyType = UIReturnKeyType.done
        textFieldChat.clearButtonMode = UITextFieldViewMode.whileEditing;
        textFieldChat.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textFieldChat.delegate = self
        textFieldChat.returnKeyType = .done
        textFieldChat.layer.zPosition = 10
        self.view.addSubview(textFieldChat)
        
    }
    
    func createLabelChat() {
        
        labelChat = UITextView(frame: CGRect(x: 10.0, y: 20.0, width: Constants.width - 20, height: Constants.height-(Constants.height/4)))
        labelChat.center = self.view.center
        labelChat.textAlignment = NSTextAlignment.justified
        labelChat.textColor = UIColor.blue
        labelChat.isUserInteractionEnabled = true
        labelChat.font = UIFont.boldSystemFont(ofSize: 12.0)
        labelChat.backgroundColor = UIColor.lightGray
        self.view.addSubview(labelChat)
        
    }
    
    func createLabelRoom() {
        
        labelRoom = UILabel(
            frame: CGRect(
                x: 10,
                y: 10,
                width: Constants.width - 20,
                height: 15))
        labelRoom.text = ""
        labelRoom.textColor = UIColor.black
        labelRoom.font = UIFont.boldSystemFont(ofSize: 8.0)
        self.view.addSubview(labelRoom)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.textFieldChat.frame = CGRect(x: 0, y: Constants.height - 255, width: Constants.width, height: 40)
        })
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
