//
//  ViewController.swift
//  ConvertUIColorToHex
//
//  Created by Fabio Cunha on 09/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aColor = UIColor(red: 0.988, green: 0.988, blue: 0.988, alpha: 1).cgColor
        let oneColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1).cgColor
        oneColor.toHex
    }


}

