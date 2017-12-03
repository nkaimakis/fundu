//
//  SocialViewController.swift
//  fundü
//
//  Created by Jordan Coppert on 12/2/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    var username:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Social"
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        setNavButtons()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setNavButtons(){
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "menu") , style: UIBarButtonItemStyle.plain, target: self, action: #selector(showMenu))
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "messages") , style: UIBarButtonItemStyle.plain, target: self, action: #selector(showMessages))
        
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
        
    }
    
    @objc func showMenu(){
        
    }
    
    @objc func showMessages(){
        
    }

}
