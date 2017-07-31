//
//  AppDelegate.swift
//  FirebaseEnvironmentsDemo
//
//  Created by Tyler Milner on 7/28/17.
//  Copyright © 2017 Bottle Rocket Studios. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
