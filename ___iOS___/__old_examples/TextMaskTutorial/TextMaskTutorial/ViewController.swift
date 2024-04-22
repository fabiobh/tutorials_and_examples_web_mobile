//
//  ViewController.swift
//  TextMaskTutorial
//
//  Created by Fabio Cunha on 26/01/23.
//

import UIKit
import MaskedUITextField

class ViewController: UIViewController {

    @IBOutlet weak var maskedTextField: MaskedUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maskedTextField.maxLength = 15
        
    }
    
    
    
    @IBAction func edtChange(_ sender: UITextField) {
        print("chageText 1")
        guard let text = sender.text else { return }
        sender.text = text.applyPatternOnNumbers(pattern: "(##) #####-####", replacementCharacter: "#")
        print("chageText 2")
    }
    
    
    
}

extension String {
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}


import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}

