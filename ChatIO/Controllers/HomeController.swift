//
//  ViewController.swift
//  ChatIO
//
//  Created by Eduardo dos santos on 18/05/2018.
//  Copyright © 2018 Eduardo dos santos. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var textFieldName : UITextField!
    var textFieldServer : UITextField!
    var button: UIButton!
    var homeTitle: UILabel!
    let gradientLayer = CAGradientLayer()
    
    @objc func nextStep() {

        if(textFieldServer.text?.isEmpty)!{
            textFieldServer.text = "http://192.168.1.111:3000"
        }
        
        if(textFieldName.text?.isEmpty)!{
            let randomIndex = Int(arc4random_uniform(UInt32(Constants.randomNames.count)))
           textFieldName.text = Constants.randomNames[randomIndex]
        }
        
        //Set Values
        Variables.userName  = "<name>\(textFieldName.text!)</name>"
        Variables.server    = textFieldServer.text
        
        //Call Next View
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let chatController = ChatController()
        chatController.modalTransitionStyle = modalStyle
        present(chatController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initLayout()
    }

}

