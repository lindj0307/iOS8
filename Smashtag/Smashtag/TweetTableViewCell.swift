//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by 林东杰 on 15/8/9.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    var tweet: Tweet? {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    
    func updateUI() {
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    tweetTextLabel.text! += "."
                }
            }
            
            tweetScreenNameLabel?.text = "\(tweet.user)"
            
            if let profileImageURL = tweet.user.profileImageURL {
                if let imageData = NSData(contentsOfURL: profileImageURL) {
                    tweetProfileImageView?.image = UIImage(data: imageData)
                }
            }
        }
    }
}
