//
//  SlideMenuViewController.swift
//  fundü
//
//  Created by Jordan Coppert on 12/3/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController {
    var tableView:UITableView!
    //Some kind of container for the options
    var menuOptions = ["Profile", "Groups", "Settings", "Logout"]
    var username: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight = UIApplication.shared.statusBarFrame.size.height
        let displayWidth = self.view.frame.width
        let displayHeight = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(SlideMenuCell.self, forCellReuseIdentifier: "slideMenuCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.gray
        self.view.addSubview(tableView)
    }
}

extension SlideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //define actions for various buttons
        switch indexPath.row{
        case 0:
            let profViewController = ProfileViewController()
            profViewController.username = self.username
            present(profViewController, animated: true, completion: nil)
        case 1: //groups
            break
        case 2: //settings
            break
        case 3: //logout
            break
        default:
            print("selected option not implemented")
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension SlideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Placeholder
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Placeholder
        let cell = tableView.dequeueReusableCell(withIdentifier: "slideMenuCell") as! SlideMenuCell
        cell.setupViews(text:menuOptions[indexPath.row])
        return cell
    }
}
