//
//  SlideMenuCell.swift
//  fundü
//
//  Created by Jordan Coppert on 12/4/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class SlideMenuCell: UITableViewCell {
    var option:String!
    var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createTitleLabel(){
        label = UILabel()
        label.text = option
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        addSubview(label)
    }
        
    
    func setupViews(){
        createTitleLabel()
        let margins = contentView.layoutMarginsGuide
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        
    }

}
