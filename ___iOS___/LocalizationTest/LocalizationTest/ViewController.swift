//
//  ViewController.swift
//  LocalizationTest
//
//  Created by fabiocunha on 24/09/22.
//

import UIKit

class ViewController: UIViewController {

    let localizedText = String(localized: "text1")
    @IBOutlet weak var label:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print("start")
        label?.text = localizedText // usa String(localized
        print(localizedText)
        
        UserDefaults.standard.set("pt-BR", forKey: "i18n_language")
        print( "text1".localized ) // usa extension
        
        UserDefaults.standard.set("en", forKey: "i18n_language")
        print( "text1".localized ) // usa extension
        
    }
    
    


}

extension String {
    var localized: String {
        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
            // we set a default, just in case
            UserDefaults.standard.set("en", forKey: "i18n_language")
            UserDefaults.standard.synchronize()
        }

        let lang = UserDefaults.standard.string(forKey: "i18n_language")

        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
