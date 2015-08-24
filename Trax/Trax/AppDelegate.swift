//
//  AppDelegate.swift
//  Trax
//
//  Created by 林东杰 on 8/24/15.
//  Copyright (c) 2015 anta. All rights reserved.
//

import UIKit

struct GPXURL {
    static let Notification = "GPXURL Radio Station"
    static let Key = "GPXURL URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //等有 airDrop 再来做
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
//        print("url = \(url) \n")
        let center = NSNotificationCenter.defaultCenter()
        let notification = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.Key:url])
        center.postNotification(notification)
        return true
    }
}

