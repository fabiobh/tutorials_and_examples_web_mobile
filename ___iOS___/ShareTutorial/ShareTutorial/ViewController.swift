//
//  ViewController.swift
//  ShareTutorial
//
//  Created by FabioCunha on 03/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 1
    @IBAction func shareFile(_ sender: Any) {
        print("shareFile")
        
        let str = "my text to be write in file.txt" // my text
        let filename = getDocumentsDirectory().appendingPathComponent("file.txt")

            do {
                try str.write(toFile: filename, atomically: true, encoding: String.Encoding(rawValue: NSUTF8StringEncoding) )

                let fileData = NSURL(fileURLWithPath: filename)

                let objectsToShare = [fileData]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                self.present(activityVC, animated: true, completion: nil)

            } catch {
                print("cannot write file")
                // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            }
    }
    
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    // 2
    @IBAction func shareTextButton(_ sender: UIButton) {
        print("shareTextButton")
        
        // text to share
        let text = "This is the text that will be shared"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
        
    // 3
    @IBAction func shareImageButton(_ sender: UIButton) {
        print("shareImageButton")
        
        // image to share
        let image = UIImage(named: "strawberry")
        
        // set up activity view controller
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

