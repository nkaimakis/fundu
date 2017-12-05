//
//  FeedViewController.swift
//  fundü
//
//  Created by Jordan Coppert on 12/2/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    var username:String!
    var token:String!
    var delegate: CenterViewControllerDelegate?
    var tableView: UITableView!
    var dailyStats: [DailyStat]!
    var feedEvents: [FeedEvent]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = (self.parent?.parent?.parent as! CenterViewControllerDelegate)
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.72, alpha:1.0)
        
        dailyStats = getDailyStats()
        feedEvents = getSummaryFeedEvents()
        setNavButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDailyStats() -> [DailyStat] {
        //Stubbing this for sake of the demo
        let stats = [DailyStat]()
        
        return stats
    }
    
    func getSummaryFeedEvents() -> [FeedEvent]{
        //Stubbing this for sake of the demo
        let events = [FeedEvent]()
        
        return events
    }
    
    func setNavButtons(){
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "menu") , style: UIBarButtonItemStyle.plain, target: self, action: #selector(showMenu))
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "messages") , style: UIBarButtonItemStyle.plain, target: self, action: #selector(showMessages))
        
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
        
    }
    
    func createTableView(){
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
    
    func setConstraints(){
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func showMenu(){
        delegate?.toggleLeftPanel?()
    }
    
    @objc func showMessages(){
        
    }

}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Placeholder
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        //Placeholder
        if(indexPath.row == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "FeedCollectionTableViewCell") as! FeedCollectionTableViewCell
//            cell.setupViews(text:menuOptions[indexPath.row])
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
//            cell.setupViews(text:menuOptions[indexPath.row])
        }
        return cell
    }
}




