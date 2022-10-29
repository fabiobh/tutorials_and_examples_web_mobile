//
//  ViewController.swift
//  AsynAwaitWriteTest
//
//  Created by fabiocunha on 20/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        call1()
    }

    func call1(){ print("call1"); call2() }
    func call2(){ print("call2"); call3() }
    func call3(){ print("call3"); call4() }
    func call4(){ print("call4");
        Task {
            await call5()
            print("finish call5")
            call6()
        }
    }
    func call5() async { print("call5"); }
    func call6()  { print("call6"); }

}

