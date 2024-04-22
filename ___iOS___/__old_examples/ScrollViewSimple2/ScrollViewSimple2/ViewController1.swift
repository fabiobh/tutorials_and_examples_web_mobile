//
//  ViewController1.swift
//  ScrollViewSimple2
//
//  Created by Fabio Cunha on 10/08/23.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let colors: [UIColor] = [.blue, .black, .red, .green, .yellow]
    
    var refhrea: UIRefreshControl {
        let ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        return ref
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(refhrea)
    }
    
    @objc func handleRefresh(_ control: UIRefreshControl) {
        print("handleRefresh start")
        scrollView.backgroundColor = colors.randomElement()
        control.endRefreshing()
    }
    
}
