//
//  ViewController.swift
//  fundü
//
//  Created by Nicholas Kaimakis on 11/29/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit


class AuthViewController: UIViewController {
    var titleLabel: UILabel!
    var mottoLabel: UILabel!
    var usernameField: UITextField!
    var passwordField: UITextField!
    var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        createTitleLabel()
        createMottoLabel()
        createLoginFields()
        createLoginButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createTitleLabel(){
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleLabel.center = CGPoint(x: 50, y: 285)
        titleLabel.textAlignment = .center
        titleLabel.text = "fundu"
        titleLabel.textColor = UIColor.white
        titleLabel.center.x = self.view.center.x
        titleLabel.center.y = self.view.center.y * 0.4
        titleLabel.font = UIFont(name: "DidactGothic-Regular", size: 44)
        self.view.addSubview(titleLabel)
    }
    
    func createMottoLabel(){
        self.mottoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: Int(self.view.bounds.width), height: 40))
        mottoLabel.center = CGPoint(x: 50, y: 285)
        mottoLabel.textAlignment = .center
        mottoLabel.text = "invest with friends"
        mottoLabel.textColor = UIColor.white
        mottoLabel.center.x = self.view.center.x
        mottoLabel.center.y = self.view.center.y * 0.6
        mottoLabel.font = UIFont(name: "OpenSans-LightItalic", size: 26)
        self.view.addSubview(mottoLabel)
    }
    
    func createLoginFields(){
        self.usernameField = getTextFieldWithPlaceholder(placeholder: "Enter username", fontSize: 14)
        usernameField.center.y = self.view.center.y * 1
        self.view.addSubview(usernameField)
        self.passwordField = getTextFieldWithPlaceholder(placeholder: "Enter password", fontSize: 14)
        passwordField!.center.y = usernameField.center.y + 50
        self.view.addSubview(passwordField)
    }
    
    func getTextFieldWithPlaceholder(placeholder: String, fontSize: Int) -> UITextField{
        let field: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
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
    
    func createLoginButton(){
        self.loginButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        loginButton.backgroundColor = UIColor.gray
        loginButton.layer.cornerRadius = 5
        loginButton.center.x = self.view.center.x
        loginButton.center.y = self.passwordField!.center.y + 100
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        loginButton.tag = 1
        self.view.addSubview(loginButton)
    }
    
    //define actions for various buttons
    @objc func buttonAction(sender: UIButton!) {
        let buttonTag: UIButton = sender
        if buttonTag.tag == 1 {
            //authenicate user
            
            //if authenticated, segue to dashboard
            if(true){
                let dashViewController = DashboardViewController()
                dashViewController.username = usernameField.text
                present(dashViewController, animated: true, completion: nil)
            }
        }
    }
}

