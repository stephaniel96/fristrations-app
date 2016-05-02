//
//  AppDelegate.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        Firebase.defaultConfig().persistenceEnabled = true
    }

    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UITabBar.appearance().tintColor = UIColor(red: 64/255.0, green: 100/255.0, blue: 149/255.0, alpha: 1.0)
        return true
    
    }
    
    


}

