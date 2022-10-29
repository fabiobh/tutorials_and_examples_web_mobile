//
//  ViewController.swift
//  MvpSimple
//
//  Created by fabiocunha on 03/09/22.
//

import UIKit

// tutorial de
// https://medium.com/swlh/simple-mvp-design-pattern-in-swift-3655811e0415

class ViewController: UIViewController {

    lazy var presenter = Presenter(with: self)
    @IBOutlet weak var changeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapMeButton(_ sender: Any) {
        presenter.buttonTapped()        
    }

}

extension ViewController: PresenterView {
    
    func updateLabel() {
        changeTextLabel.text = "I have been changed!"
        self.view.backgroundColor = .yellow        
    }
    
}
