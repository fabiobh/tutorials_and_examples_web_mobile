//
//  ViewController.swift
//  AcessibilityIdentifierTest
//
//  Created by Fabio Cunha on 04/05/23.
//

import UIKit

class ViewController: UIViewController {

    var myLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel = self.view.viewWithTag(10) as? UILabel
        //myLabel.accessibilityIdentifier = "simpleLabel"
        myLabel.text = "Text changed by accessibilityIdentifier"
        print("start")
        
    }

    
    

}

