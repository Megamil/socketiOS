//
//  ViewFormHome.swift
//  ChatIO
//
//  Created by Eduardo dos santos on 18/05/2018.
//  Copyright © 2018 Eduardo dos santos. All rights reserved.
//

import UIKit

extension HomeController {
    
    func initLayout(){
        self.createGradientLayer()
        self.createTitle()
        self.createTextFieldName()
        self.createTextFieldServer()
        self.createButton()
    }
    
    func createGradientLayer() {
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func createTitle() {
        
        homeTitle = UILabel(
                        frame: CGRect(
                                x: 0,
                                y: 0,
                                width: 200,
                                height: 21))
        homeTitle.center = CGPoint(x: Constants.width/2, y: 100)
        homeTitle.textAlignment = .center
        homeTitle.text = Constants.homeTitle
        homeTitle.textColor = UIColor.white
        homeTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.view.addSubview(homeTitle)
        
    }
    
    func createTextFieldName() {
        
        textFieldName =  UITextField(
                            frame: CGRect(
                                    x: 20,
                                    y: 150,
                                    width: Constants.width - 40,
                                    height: 40))
        textFieldName.placeholder = Constants.homePlaceholderName
        textFieldName.font = UIFont.systemFont(ofSize: 15)
        textFieldName.borderStyle = UITextBorderStyle.roundedRect
        textFieldName.autocorrectionType = UITextAutocorrectionType.no
        textFieldName.keyboardType = UIKeyboardType.default
        textFieldName.returnKeyType = UIReturnKeyType.done
        textFieldName.clearButtonMode = UITextFieldViewMode.whileEditing;
        textFieldName.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.view.addSubview(textFieldName)
        
    }
    
    func createTextFieldServer() {
        
        textFieldServer = UITextField(
                            frame: CGRect(
                                    x: 20,
                                    y: 200,
                                    width: Constants.width - 40,
                                    height: 40))
        textFieldServer.placeholder = Constants.homePlaceholderServer
        textFieldServer.font = UIFont.systemFont(ofSize: 15)
        textFieldServer.borderStyle = UITextBorderStyle.roundedRect
        textFieldServer.autocorrectionType = UITextAutocorrectionType.no
        textFieldServer.keyboardType = UIKeyboardType.default
        textFieldServer.returnKeyType = UIReturnKeyType.done
        textFieldServer.clearButtonMode = UITextFieldViewMode.whileEditing;
        textFieldServer.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.view.addSubview(textFieldServer)
        
    }
    
    func createButton(){
        
        button = UIButton(
                    frame: CGRect(
                            x: 20,
                            y:250,
                            width: Constants.width - 40,
                            height: 40))
        button.setTitle(Constants.homeButton, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 5
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
