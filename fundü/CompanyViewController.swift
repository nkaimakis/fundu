//
//  CompanyViewController.swift
//  fundü
//
//  Created by Myrl Marmarelis on 12/7/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    var ticker: String!
    
    let tickerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dimensions = self.view.frame
        self.tickerLabel.frame = CGRect(x: dimensions.width/2-40, y: 100, width: 80, height: 20)
        self.tickerLabel.text = self.ticker
        self.tickerLabel.textAlignment = .center
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        self.addSubviews()
    }
    
    func addSubviews() {
        self.view.addSubview(self.tickerLabel)
    }
}

