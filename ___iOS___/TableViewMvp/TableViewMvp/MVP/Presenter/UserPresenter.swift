//
//  UserPresenter.swift
//  TableViewMvp
//
//  Created by fabiocunha on 14/09/22.
//

import Foundation
import UIKit

protocol UserPresenterDelegate {
    func presentUser(users: [User])
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("data error")
                return
            }
            do {
                print("try get users")
                let users = try JSONDecoder().decode([User].self, from: data)
                print("users: \(users)")
                self?.delegate?.presentUser(users: users)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func didTap(user: User) {
        // 1st way to show data
//        delegate?.presentAlert(
//            title: user.name,
//            message: "\(user.name) has a email of \(user.email) and username of \(user.username)"
//        )
        
        let title = user.name
        let message = "\(user.name) has a email of \(user.email) and username of \(user.username)"
                
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        delegate?.present(alert, animated: true)
        
    }
}
