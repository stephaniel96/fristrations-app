//
//  AppDelegate.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/24/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let nav1 = UINavigationController()
        let vc1 = NearbyViewController()
        nav1.viewControllers = [vc1]
        
        let nav2 = UINavigationController()
        let vc2 = SettingsViewController()
        nav2.viewControllers = [vc2]
        
        let nav3 = UINavigationController()
        let vc3 = SearchViewController()
        nav3.viewControllers = [vc3]
        
        let nav4 = UINavigationController()
        let vc4 = MoreViewController()
        nav4.viewControllers = [vc4]
        
        let tabs = UITabBarController()
        tabs.viewControllers = [nav1, nav2, nav3, nav4]
        
        self.window!.rootViewController = tabs;
        self.window?.makeKeyAndVisible();
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

