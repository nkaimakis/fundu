//
//  ViewController.swift
//  fundü
//
//  Created by Nicholas Kaimakis on 11/29/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        createTitleLabel()
        createLoginFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createTitleLabel(){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleLabel.center = CGPoint(x: 50, y: 285)
        titleLabel.textAlignment = .center
        titleLabel.text = "fundu"
        titleLabel.textColor = UIColor.white
        titleLabel.center.x = self.view.center.x
        titleLabel.center.y = self.view.center.y * 0.8
        titleLabel.font = UIFont(name: "DidactGothic-Regular", size: 44)
        self.view.addSubview(titleLabel)
    }
    
    func createLoginFields(){
        let usernameField: UITextField = getTextFieldWithPlaceholder(placeholder: "Enter username", fontSize: 14)
        usernameField.center.y = self.view.center.y * 1.2
        self.view.addSubview(usernameField)
        let passwordField: UITextField = getTextFieldWithPlaceholder(placeholder: "Enter password", fontSize: 14)
        passwordField.center.y = usernameField.center.y + 30
        self.view.addSubview(passwordField)
    }
    
    func getTextFieldWithPlaceholder(placeholder: String, fontSize: Int) -> UITextField{
        let field: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        field.center.x = self.view.center.x
        field.placeholder = placeholder
        field.borderStyle = UITextBorderStyle.roundedRect
        field.font = UIFont(name: "DidactGothic-Regular", size: CGFloat(fontSize))
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextFieldViewMode.whileEditing
        field.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        field.backgroundColor = UIColor.white
        return field
    }
}

