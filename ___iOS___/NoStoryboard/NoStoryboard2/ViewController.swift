//
//  ViewController.swift
//  NoStoryboard2
//
//  Created by fabiocunha on 02/09/22.
//

import UIKit

class ViewController: UIViewController {

    // 1 - create a UILabel using ViewCode
    private var textLabel:UILabel = {
        var tv = UILabel()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
    }

    func configureScreen() {
                
        // 2 - add UILabel to view hierarchy
        self.view.addSubview(textLabel)
        
        // 3 - setContraints
        textLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        //textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // 4 - set a text for UILabel
        textLabel.text = "no storyboard for UIKit"
        
    }

}

