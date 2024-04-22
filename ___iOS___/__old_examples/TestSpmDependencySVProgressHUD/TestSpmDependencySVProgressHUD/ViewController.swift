//
//  ViewController.swift
//  TestSpmDependencySVProgressHUD
//
//  Created by Fabio Cunha on 26/11/22.
//

import UIKit
//import FlagKit
import MBProgressHUD
//import MyPlayer
//import SVProgreesHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = MBProgressHUD()
        //view.addSubview(a)
        a.show(animated: true)
        view.backgroundColor = .red
        
        let z = MyPlayer()
        z.printTest()
        
        let c = SVProgressHUD()
        view.addSubview(c)
        c.backgroundColor = .green
        c.isHidden = false
        /*
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
        SVProgressHUD.dismiss()
        */
        
    }

    
    

}

