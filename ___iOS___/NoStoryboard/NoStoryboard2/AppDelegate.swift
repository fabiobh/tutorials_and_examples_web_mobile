//
//  AppDelegate.swift
//  NoStoryboard2
//
//  Created by fabiocunha on 02/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 1
    // only need this UIWindow object
    var window:UIWindow?
    
    // 2
    // only function called "didFinishLaunchingWithOptions" is neccessary on AppDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange        
        window?.rootViewController = ViewController()
        
        return true
    }

    // 3
    // nothing more is required
}

