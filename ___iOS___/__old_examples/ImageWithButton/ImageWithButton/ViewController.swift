//
//  ViewController.swift
//  ImageWithButton
//
//  Created by Fabio Cunha on 10/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bt1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bt1.setTitle("ccccc", for: .normal)
        bt1.imageView?.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
    }


}

