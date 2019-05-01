//
//  AppDelegate.swift
//  Sample
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import UIKit
import BottomNav

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc1 = CounterViewController()
        vc1.view.backgroundColor = .white
        let vc2 = CounterViewController()
        vc2.view.backgroundColor = .blue
        let vc3 = CounterViewController()
        vc3.view.backgroundColor = .green
        let vc4 = CounterViewController()
        vc4.view.backgroundColor = .purple
        let vc = BottomNavViewController()
        vc.viewControllers = [vc1,vc2,vc3, vc4]
        vc.icons = [UIImage(named: "home")!, UIImage(named: "search")!, UIImage(named: "user")!, UIImage(named: "cart")!]
        //vc.titles = ["Red", "Blue", "Green", "Purple"]
        
        
        self.window?.rootViewController = vc
        
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

