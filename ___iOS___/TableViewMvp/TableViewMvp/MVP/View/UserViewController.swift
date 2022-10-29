//
//  ViewController.swift
//  TableViewMvp
//
//  Created by fabiocunha on 13/09/22.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserPresenterDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let a1 = User(name: "a1", email: "a1@a", username: "a")
    let a2 = User(name: "a2", email: "a2@a", username: "aa")
    let a3 = User(name: "a3", email: "a3@a", username: "aaa")
    
    private var users = [User]()
        
    private let presenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        
        print("start")
        // Table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        users.append(a1)
        users.append(a2)
        users.append(a3)
        
        // Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    // Table Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        print("users[indexPath.row].name: \(users[indexPath.row].name)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Ask presenter to handle the tap
        presenter.didTap(user: users[indexPath.row])
    }

    
    
    // Presenter Delegate
    func presentUser(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        // 1st way to show data
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//        present(alert, animated: true)
    }
    
}

