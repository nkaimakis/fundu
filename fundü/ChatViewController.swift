//
//  ChatViewController.swift
//  fundü
//
//  Created by Myrl Marmarelis on 12/5/17.
//  Copyright © 2017 fundü. All rights reserved.
//

import UIKit
import SendBirdSDK

class ChatViewController: UITableViewController, SBDChannelDelegate {
    var username:String! = "test"
    var token:String!
    var channels:[SBDGroupChannel]?
    let unique_identifier:String = "lit ass chat view"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.21, green:0.84, blue:0.89, alpha:0.8)
        self.setNavButtons()
        setupChatCell()
        SBDMain.add(self as SBDChannelDelegate, identifier: unique_identifier)
        if SBDMain.getConnectState() != SBDWebSocketConnectionState.open {
            SBDMain.connect(withUserId: username) { (user, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                print("CONNECTED")
                self.justConnected()
            //SBDMain.updateCurrentUserInfo(withNickname: , profileUrl: , completionHandler: ) use this to set nicknames
            }
        } else {
            self.justConnected()
        }
        // Do any additional setup after loading the view.
    }
    
    func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {
        let userMessage = message as! SBDUserMessage
        print(userMessage.message!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setNavButtons(){
        let newChatButton = UIBarButtonItem(image: UIImage(named: "messages"),
                                            style: UIBarButtonItemStyle.plain,
                                            target: self, action: #selector(newChat))
        self.navigationItem.setRightBarButton(newChatButton, animated: false)
        let closeButton = UIBarButtonItem(image: UIImage(named: "messages"),
                                          style: UIBarButtonItemStyle.plain,
                                          target: self, action: #selector(close))
        self.navigationItem.setLeftBarButton(closeButton, animated: false)
    }
    
    @objc func newChat() {
        
    }
    
    @objc func close() {
        self.navigationController!.dismiss(animated: true) {
            SBDMain.removeChannelDelegate(forIdentifier: self.unique_identifier)
            print("LEFT")
        }
    }
    
    func justConnected() {
        SBDGroupChannel.createChannel(withName: "$$$", userIds: ["test"], coverUrl: nil, data: nil) {
            (channel, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            channel!.sendUserMessage("sup", completionHandler: { (message, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                self.channel(channel!, didReceive: message!)
            })
        }
        let query = SBDGroupChannel.createMyGroupChannelListQuery()!
        query.includeEmptyChannel = true
        query.loadNextPage() { (channels, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            print("You are in these channels:")
            for channel in channels! {
                print(channel.name)
            }
            self.channels = channels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.channels ?? []).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ChatCell")
        cell.textLabel?.text = self.channels![indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let groupViewController = GroupViewController()
        groupViewController.chatController = self
        self.navigationController!.pushViewController(groupViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupChatCell() {
        // nothing here
    }
    
}
