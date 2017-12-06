//
//  FeedCollectionTableViewCell.swift
//  fundü
//
//  Created by Jordan Coppert on 12/5/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class FeedCollectionTableViewCell: UITableViewCell {
    var collectionOfStats: [DailyStat]!
    var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createCollection(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        collection.register(DashboardCollectionViewCell.self, forCellWithReuseIdentifier: "DailyStat")
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.purple
        contentView.addSubview(collection)
    }
    
    func setConstraints(){
        let margins = contentView.layoutMarginsGuide
        collection.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
        collection.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
    }
    
    func setupViews(stats:[DailyStat]){
        //contentView.backgroundColor = UIColor.gray
        collectionOfStats = stats
        createCollection()
        setConstraints()
    }

}

extension FeedCollectionTableViewCell: UICollectionViewDelegate {
    //Stubbed, would put code in here to transition to appropriate screen / take action
}

extension FeedCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionOfStats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyStat", for: indexPath) as! DashboardCollectionViewCell
        cell.backgroundColor = UIColor.red
        cell.setupViews(data:collectionOfStats[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

//Size for stat cells
extension  FeedCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.bounds.width * 0.4, height: contentView.bounds.height)
    }
}
