//
//  ViewController.swift
//  ResizingTokenFieldTuto
//
//  Created by Fabio Cunha on 06/06/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ResizingTokenFieldDelegate {
    
    class TokenLabel: ResizingTokenFieldToken, Equatable {
        
        static func == (lhs: TokenLabel, rhs: TokenLabel) -> Bool {
            return lhs === rhs
        }
        
        var title: String
        
        init(title: String) {
            self.title = title
        }
    }
    
    
    @IBOutlet weak var tokenField: ResizingTokenField!
    
    private lazy var titles: [String] = { "Lorem Ipsum Dolor Sit Amet Consectetur Adipiscing Elit".components(separatedBy: " ") }()
    private var randomTitle: String { return titles[Int(arc4random_uniform(UInt32(titles.count)))] }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenField.layer.borderWidth = 1
        tokenField.layer.borderColor = UIColor.orange.cgColor
        tokenField.preferredTextFieldReturnKeyType = .done
        tokenField.delegate = self
        tokenField.textFieldDelegate = self
        tokenField.shouldTextInputRemoveTokensAnimated = true
        tokenField.shouldExpandTokensAnimated = true
        tokenField.shouldCollapseTokensAnimated = true

        let placeholder = "Type here 1 Type here 2 Type here 3 Type here 4 \n\r Type here Type here Type here Type here Type here Type here Type here Type here Type here"
        tokenField.placeholder = placeholder
        //tokenField.textFieldMinWidth = 200
        
        
        //tokenField.labelText = "Tokens:"
        let tokens: [TokenLabel] = [
            TokenLabel(title: "Lorem"),
            TokenLabel(title: "Ipsum")
        ]
        
        tokenField.append(tokens: tokens)
        
    }
    
    
    
    

    // MARK: - ResizingTokenFieldDelegate
    
    func resizingTokenFieldShouldCollapseTokens(_ tokenField: ResizingTokenField) -> Bool {
        //return collapseSwitch.isOn
        return true
    }
    
    func resizingTokenFieldCollapsedTokensText(_ tokenField: ResizingTokenField) -> String? {
        return "Hiding \(tokenField.tokens.count) tokens…"
    }
    
    func resizingTokenField(_ tokenField: ResizingTokenField, willChangeHeight newHeight: CGFloat) {
        //if true {
        //    scrollView.layoutIfNeeded()
        //}
    }
    
    func resizingTokenField(_ tokenField: ResizingTokenField, didChangeHeight newHeight: CGFloat) {
        /*
        if animateSwitch.isOn {
            UIView.animate(withDuration: tokenField.animationDuration) {
                self.scrollView.layoutIfNeeded()
            }
        }
         */
    }
    
    func resizingTokenField(_ tokenField: ResizingTokenField, configurationForDefaultCellRepresenting token: ResizingTokenFieldToken) -> DefaultTokenCellConfiguration? {
        /*
        if token.title.lowercased() == "custom" {
            return CustomConfiguration()
        }
        */
        return nil
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField == tokenField.textField else { return true }
        guard let text = textField.text, !text.isEmpty else { return true }
        
        tokenField.append(tokens: [TokenLabel(title: text)], animated: true)
        tokenField.text = nil
        return false
    }

}

