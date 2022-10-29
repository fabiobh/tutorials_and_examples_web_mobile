//
//  ViewController.swift
//  GraphQlTutorial
//
//  Created by fabiocunha on 04/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("start")
        Network.shared.apollo.fetch(query: SpecificCountryQuery()) { result in
            print("result")
                        
            switch result {
            case .success(let graphQlResult):
                print("graphQlResult: \(graphQlResult.data?.country?.name)")
            case .failure(let error):
                print("Error: \(error)")
            }
            
            
        }
    }


}

