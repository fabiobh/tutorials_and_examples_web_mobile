//
//  ViewController.swift
//  testDidSet
//
//  Created by fabiocunha on 13/08/22.
//

import UIKit

class ViewController: UIViewController {

    var textToModify: String = "" {
        didSet {
            myTextView.text = textToModify
        }
    }
    
    private let myTextView: UITextView = {
        let textView = UITextView()
        textView.text = "111"
        textView.frame = CGRect(x: 20,y: 20,width: 100,height: 100)
        textView.contentInsetAdjustmentBehavior = .automatic
        //textView.center = self().view.center
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTextView)
        
        textToModify = "333"
        myTextView.text = "222"
    }


}

class mmms: UITableViewCell {
    
    
    var textToModify: String = "" {
        didSet {
            textLabel?.text = ""
            detailTextLabel?.text = "1"
        }
    }
    
}

