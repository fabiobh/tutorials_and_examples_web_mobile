//
//  ViewController.swift
//  TextViewWithCustomText
//
//  Created by Fabio Cunha on 17/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let aaa =
            NSMutableAttributedString()
                .bold("Address: ",11)
                .normal(" Kathmandu, Nepal\n\n",14)
                //.orangeHighlight(" Email: ")
                //.blackHighlight(" prajeet.shrestha@gmail.com ")
                .bold("\n\nCopyright: ",20)
                //.underlined(" All rights reserved. 2020.")
        
        let htmlMock = """
        <span style="color:#FF0000">Your text here</span>
        <b>hello</b>, <i>world</i>, <u>underline</u>
        """

        let descriprionLabel = UILabel()
        descriprionLabel.attributedText = htmlMock.htmlAttributed(family: "YourFontFamily", size: 15, color: .red)
        
        myTextView.attributedText = htmlMock.htmlAttributed(family: "YourFontFamily", size: 14, color: .red)
        
        
    }


}

extension NSMutableAttributedString {
    
    
    func bold(_ value:String, _ myFontSize:CGFloat) -> NSMutableAttributedString {
        let boldFont:UIFont = UIFont.boldSystemFont(ofSize: myFontSize)
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String, _ myFontSize:CGFloat) -> NSMutableAttributedString {
        var normalFont:UIFont = UIFont.systemFont(ofSize: myFontSize)
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /*
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    */
    
    func createHtmlLabel(with html: String) -> UILabel {
        let htmlMock = """
        <b>hello</b>, <i>world</i>
        """

        let descriprionLabel = UILabel()
        descriprionLabel.attributedText = htmlMock.htmlAttributed(family: "YourFontFamily", size: 15, color: .red)

        return descriprionLabel
    }
    
}

extension String {
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
            //"color: #\(color.) !important;" +
                //"font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
