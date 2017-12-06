//
//  DashboardCollectionViewCell.swift
//  fundü
//
//  Created by Jordan Coppert on 12/5/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    var image:UIImageView!
    var label: UILabel!
    var info: DailyStat!
    
    //So content is not redrawn by itemForRowAtIndexPath
    override func prepareForReuse() {
        label = nil
        image = nil
    }
    
    func createImage(){
        image = UIImageView(image: UIImage(named:info.image))
        image.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height * 0.6)
        image.contentMode = UIViewContentMode.scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.height/2
        contentView.addSubview(image)
    }
    
    func createLabel(){
        label = UILabel()
        label.text = info.message
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        contentView.addSubview(label)
    }
    
    func setConstraints(){
        let margins = contentView.layoutMarginsGuide
        image.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        label.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
    }
    
    func setupViews(data: DailyStat){
        info = data
        createImage()
        createLabel()
        setConstraints()
    }
}
