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
        image = StatImageView(image: UIImage(named:info.image))
        image.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width * 0.8, height: contentView.bounds.width * 0.8)
        image.contentMode = UIViewContentMode.scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        image.backgroundColor = UIColor.white
        contentView.addSubview(image)
    }
    
    func createLabel(){
        label = UILabel()
        label.text = info.message
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        contentView.addSubview(label)
    }
    
    func setConstraints(){
        let margins = contentView.layoutMarginsGuide
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.topAnchor.constraintEqualToSystemSpacingBelow(margins.topAnchor, multiplier: 1.3).isActive = true
        image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        label.topAnchor.constraintEqualToSystemSpacingBelow(image.bottomAnchor, multiplier: 2).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: contentView.bounds.width * 0.8).isActive = true
    }
    
    //Not working, *FIX*
    func setShadow(){
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func setupViews(data: DailyStat){
        info = data
        createImage()
        createLabel()
        setConstraints()
        setShadow()
    }
}
