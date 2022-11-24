//
//  ViewController.swift
//  NavigationButtonBarTest
//
//  Created by fabiocunha on 24/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.tintColor = .green
        print("navigationController?.isNavigationBarHidden: \(navigationController?.isNavigationBarHidden)")
        title = "Navitate Button Test"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }

    @objc func addTapped() {
        print("hi")
    }

}

