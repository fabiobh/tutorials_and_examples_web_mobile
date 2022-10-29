//
//  ViewController.swift
//  tutorial_Self_Vs_self
//
//  Created by fabiocunha on 13/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let a = 6
        print("a.squared()")
        print(a.squared())
    }


}

extension Int {
    func squared() -> Int {
        self * self
    }
}

