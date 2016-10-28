//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Jake on 10/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
        return true
    }
    
}

