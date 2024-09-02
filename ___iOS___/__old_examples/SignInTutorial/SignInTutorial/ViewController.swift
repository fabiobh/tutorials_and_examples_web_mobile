//
//  ViewController.swift
//  SignInTutorial
//
//  Created by Fabio Cunha on 16/11/22.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    private let signinButton = ASAuthorizationAppleIDButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(signinButton)
        signinButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }

    @objc func didTapSignIn() {
        print("oi")
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signinButton.frame = CGRect(x: 0,y: 0,width: 250,height: 50)
        signinButton.center = view.center
    }

}

extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("failed: \(error)")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            
            let firstName = credentials.fullName?.givenName
            let middleName = credentials.fullName?.middleName ?? ""
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            print("firstName: \(firstName) - middleName: \(middleName) - lastName: \(lastName) - email: \(email) - ")
            print("credentials.user: \(credentials.user)")
            print("credentials.authorizedScopes: \(credentials.authorizedScopes)")
            print("credentials.authorizationCode: \(String(describing: credentials.authorizationCode))")
            print("credentials.identityToken: \(String(describing: credentials.identityToken))")
            let tokenString = String(decoding: credentials.identityToken!, as: UTF8.self)
            print("credentials.identityToken: \(tokenString)")
            print("credentials.realUserStatus: \(credentials.realUserStatus)")
            
            break
        default:
            print("didCompleteWithAuthorization default")
            break
        }
        
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        print("present apple login")
        return view.window!
    }
    
    
}
