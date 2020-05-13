//
//  AppDelegate.swift
//  Inbox
//
//  Created by Helder Pinhal on 12/05/2020.
//  Copyright © 2020 Notificare. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, NotificarePushLibDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NotificarePushLib.shared().initialize(withKey: nil, andSecret: nil)
        NotificarePushLib.shared().delegate = self
        NotificarePushLib.shared().launch()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: Notificare
    
    func notificarePushLib(_ library: NotificarePushLib, onReady application: NotificareApplication) {
        // At this point you have been assigned a temporary device identifier
        // All services subscribed can be used
        
        NotificarePushLib.shared().registerForNotifications()
    }
}
