//
//  SlideMenuViewController.swift
//  fundü
//
//  Created by Jordan Coppert on 12/3/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController {
    var tableView = UITableView()
    //Some kind of container for the options
    var menuOptions = [Int]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension SlideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension SlideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Placeholder
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Placeholder
        let cell = UITableViewCell()
        return cell
    }
}
