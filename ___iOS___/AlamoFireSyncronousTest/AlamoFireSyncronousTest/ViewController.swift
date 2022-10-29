//
//  ViewController.swift
//  AlamoFireSyncronousTest
//
//  Created by fabiocunha on 17/08/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start")
        
        for i in 0 ..< 5 {
            print("Request Number" ,i)
            let runLoop = CFRunLoopGetCurrent()
            AF.request("https://httpbin.org/get", parameters: ["foo": "bar", "a": i]).responseJSON { response in
                print("Finished request \(i)")
                print(response.request?.url)
                CFRunLoopStop(runLoop)
            }
            CFRunLoopRun()
        }
        
        print("end")
        
    }


}

