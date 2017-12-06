//
//  ProfileViewController.swift
//  fundü
//
//  Created by Nicholas Kaimakis on 12/3/17.
//  Copyright © 2017 fundü. All rights reserved.
//

/*
 should have profile photo, username, email, password change button, notification settings button
 current portfolio valuation, # of groups you're in, payment methods
 */

import UIKit
import Charts

extension UIImageView {
    //round edges of profile photo
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) 
        self.layer.masksToBounds = true
    }
}

class ProfileViewController: UIViewController {
    var headshot: UIImageView!
    var usernameLabel: UILabel!
    var groupsLabel: UILabel!
    var username: String!
    var screenSize: CGRect!
    var navBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        setNavBar()
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        renderProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func renderProfile(){
        renderProfilePhoto()
        renderUserInfo()
        renderPortfolio()
    }
    
    func renderProfilePhoto(){
        //sample image, to be replaced by user stored image
        self.headshot = UIImageView(image: UIImage(named: "headshot"))
        self.headshot.frame = CGRect(x:self.view.center.x, y:0, width:100, height:100)
        self.headshot.setRounded()
        self.headshot.clipsToBounds = true
        self.headshot.center = CGPoint(x: Int(self.view.bounds.width * 0.25), y: 125)
        self.view.addSubview(self.headshot)
    }
    //# of groups, username
    func renderUserInfo(){
        //create labels Int(self.headshot.center.y + 80)
        self.usernameLabel = UILabel(frame: CGRect(x: 0, y: Int(self.headshot.center.y + 80), width: Int(self.view.bounds.width * 0.5), height: 30))
        self.usernameLabel.textAlignment = .center
        self.usernameLabel.center = CGPoint(x: Int(self.view.bounds.width * 0.75), y: 90)
        self.usernameLabel.textColor = UIColor.white
        self.usernameLabel.font = UIFont(name: "DidactGothic-Regular", size: 28)
        self.usernameLabel.text = self.username
        
        //fill username value if blank
        if(self.username == nil || self.username == "") {self.usernameLabel.text = "nkaimakis"}
        
        //Int(self.headshot.center.y + 80)
        self.groupsLabel = UILabel(frame: CGRect(x:Int(self.view.bounds.width * 0.75), y: Int(self.headshot.center.y + 80), width: Int(self.view.bounds.width * 0.5), height: 30))
        self.groupsLabel.textAlignment = .center
        self.groupsLabel.center = CGPoint(x: Int(self.view.bounds.width * 0.75), y: 130)
        self.groupsLabel.textColor = UIColor.white
        self.groupsLabel.font = UIFont(name: "DidactGothic-Regular", size: 24)
        self.groupsLabel.text = "10 groups"
        
        //add to view
        self.view.addSubview(self.usernameLabel)
        self.view.addSubview(self.groupsLabel)
    }
    func renderPortfolio(){
        //create view for graphs/performance
        
        
    }
    func setNavBar() {
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        addBackButton()
        self.view.addSubview(navBar)
    }
    
    func addBackButton() {
        let navItem = UINavigationItem(title: "Profile")
        let backButton = UIBarButtonItem(title: "< Dashboard", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backAction))
        navItem.leftBarButtonItem = backButton
        self.navBar.setItems([navItem], animated: false)
    }
    
    @objc func backAction(_ sender: UIButton) {
        let dashViewController = DashboardContainerViewController()
        dashViewController.username = self.username
        present(dashViewController, animated: true, completion: nil)
    }
}
