//
//  ViewController.swift
//  UiMenuTutorial
//
//  Created by Fabio Cunha on 17/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButton()
    }

    func setPopupButton(){
        
        let optionClosure = {( action : UIAction ) in
            print(action.title)}
        
        myPopButton.menu = UIMenu(children: [
            UIAction(title: "Option 1", handler: optionClosure),
            UIAction(title: "Option 2", handler: optionClosure),
            UIAction(title: "Option 3", handler: optionClosure)
        ])
        
        myPopButton.showsMenuAsPrimaryAction = true
        myPopButton.changesSelectionAsPrimaryAction = true
    }

}

