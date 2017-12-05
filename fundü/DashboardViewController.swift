//
//  DashboardViewController.swift
//  fundü
//
//  Created by Nicholas Kaimakis on 12/2/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class DashboardViewController: UITabBarController {
    var username: String!
    var token:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        setTabBarController()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTabBarController(){
        let feed = FeedContainerViewController()
        feed.token = token
        feed.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "feed"), tag: 0)
        
        let social = SocialContainerViewController()
        social.token = token
        social.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "social"), tag: 1)
        
        let controllers = [feed,social]
        self.viewControllers = controllers
    }

}


