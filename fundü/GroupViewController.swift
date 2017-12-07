//
//  GroupViewController.swift
//  fundü
//
//  Created by Myrl Marmarelis on 12/5/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import SendBirdSDK
import UIKit

class GroupViewController: UIViewController {
    var chatController: ChatViewController!
    
    let textView = UITextView()
    let inputTextField = UITextField()
    let sendButton = UIButton()
    
    let inputHeight = CGFloat(100)
    let keyboardHeight = CGFloat(216)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.89, alpha:0.8)
        self.textView.backgroundColor = UIColor(red:0.61, green:0.84, blue:0.89, alpha:0.8)
        self.inputTextField.backgroundColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha:0.8)
        self.setNavButtons()
        let dimensions = self.view.frame
        self.textView.frame = CGRect(x: dimensions.minX,
                                     y: dimensions.minY,
                                     width: dimensions.width,
                                     height: dimensions.height - self.inputHeight - self.keyboardHeight)
        self.textView.isEditable = false
        self.inputTextField.frame = CGRect(x: dimensions.minX,
                                           y: dimensions.maxY - self.inputHeight - self.keyboardHeight,
                                           width: dimensions.width,
                                           height: self.inputHeight)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.inputHeight))
        self.inputTextField.leftView = paddingView
        self.inputTextField.leftViewMode = .always
        self.sendButton.frame = CGRect(x: dimensions.maxX - 60,
                                       y: dimensions.maxY - self.keyboardHeight - 30,
                                       width: 50,
                                       height: 30)
        self.sendButton.setTitle("Send", for: UIControlState.normal)
        self.sendButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.sendButton.addTarget(self, action: #selector(sendAction), for: UIControlEvents.touchUpInside)
        self.addSubviews()
    }
    
    func receive(_ message: SBDUserMessage) {
        var name = message.sender!.userId
        if (message.sender!.nickname ?? "") != "" {
            name = message.sender!.nickname!
        }
        let text = "\n" + name + ": " + message.message!
        self.textView.text.append(text)
    }
    
    func setNavButtons() {
        
    }
    
    @objc func sendAction() {
        self.chatController.send(self.inputTextField.text!)
    }
    
    func addSubviews() {
        self.view.addSubview(self.textView)
        self.view.addSubview(self.inputTextField)
        self.view.addSubview(self.sendButton)
    }
}
