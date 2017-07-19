//
//  AppDelegate.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/13/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let runCollection = RunCollection()
    let planCollection = PlanCollection()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Global access to runs and eventually plans
        let navController = window!.rootViewController as! UINavigationController
        let homeController = navController.topViewController as! HomeViewController
        homeController.runCollection = runCollection
        homeController.planCollection = planCollection
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let success = runCollection.saveChanges()
        if (success) {
            print("Saved all runs")
        }
        else {
            print("Could not save runs")
        }
        
        let success2 = planCollection.saveChanges()
        if (success2) {
            print("Saved all plans")
        }
        else {
            print("Could not save plans")
        }
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

