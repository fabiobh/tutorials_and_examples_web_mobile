//
//  AppDelegate.swift
//  GoogleSignInTutorial
//
//  Created by Fabio Cunha on 28/11/22.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    // com.googleusercontent.apps.1234567890-abcdefg
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //let signInConfig = GIDConfiguration(clientID: "1043177150642-05cola6cldo0kku8tptjpk8tn6mp7tap.apps.googleusercontent.com")
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
              // Show the app's signed-out state.
                print("sem usuario logado")
            } else {
              // Show the app's signed-in state.
                print("user: \(user?.profile?.name) logado")
            }
        }


        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
          var handled: Bool
        
        //Google SignIn handler
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            print("handle true")
            return true
        }

        // Handle other custom URL types.
        // If not handled by this app, return false.
        print("handle false")
        return false
    }



}

