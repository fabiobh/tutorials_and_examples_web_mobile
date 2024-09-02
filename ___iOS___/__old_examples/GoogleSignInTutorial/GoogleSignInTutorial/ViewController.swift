//
//  ViewController.swift
//  GoogleSignInTutorial
//
//  Created by Fabio Cunha on 28/11/22.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = GIDSignInButton(frame: CGRect(x: 20,y: 20,width: 200,height: 200))
        button.addTarget(self, action:#selector(handleLogin), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func handleLogin(sender: UIButton){
        startGoogleLogin()
    }
    
    fileprivate func startGoogleLogin() {
        // login first way
        let signInConfig = GIDConfiguration(clientID: "1043177150642-05cola6cldo0kku8tptjpk8tn6mp7tap.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            print("error: \(error)")
            guard error == nil else { return }
            
            print("user id: \(user?.userID)")
            print("accessToken: \(user?.authentication.accessToken)")
            print("refreshToken: \(user?.authentication.refreshToken)")
            print("idToken: \(user?.authentication.idToken)")
            print("accessTokenExpirationDate: \(user?.authentication.accessTokenExpirationDate)")
            print("user name: \(user?.profile?.name)")
            print("user email: \(user?.profile?.email)")

            // If sign in succeeded, display the app's main content View.
        }
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        // login second way
        
        startGoogleLogin()
        

    }
    
}

