//
//  ViewController.swift
//  TabsTutorial
//
//  Created by Fabio Cunha on 07/08/23.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func myTouch(_ sender: Any) {
        print("callTabBar v1")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let next:UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeTabViewController")
        //self.navigationController!.pushViewController(next, animated: true)
        self.navigationController!.setViewControllers([next], animated: true)
    }
    
    @IBAction func callTabBar(_ sender: UIButton) {
        print("callTabBar v2")
        
    }
    
}

