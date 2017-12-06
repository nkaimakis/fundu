//
//  FeedTableViewCell.swift
//  fundü
//
//  Created by Jordan Coppert on 12/5/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    var event:FeedEvent!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews(feedEvent:FeedEvent){
        //contentView.backgroundColor = UIColor.gray
        event = feedEvent
        //        createTitleLabel()
        //        setConstraints()
    }

}
