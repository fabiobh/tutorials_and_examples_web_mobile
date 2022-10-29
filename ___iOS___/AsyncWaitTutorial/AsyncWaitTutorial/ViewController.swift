//
//  ViewController.swift
//  AsyncWaitTutorial
//
//  Created by fabiocunha on 01/06/22.
//

import UIKit

class ViewController: UIViewController {

    fileprivate func loadDataV1() -> Task<(), Never> {
        return async {
            do {
                let a = try await loadUsingAsync()
                print("a")
                print(a)
            } catch {
                print("Error")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Task.init(priority: .high, operation: <#T##() async throws -> _#>)
        print("start")
        //loadDataV1()
        loadDataV2()
        print("end")
        
    }
    
    func loadDataV2() {
        Task.init(priority: .high, operation: {
            do {
                let a = try await loadUsingAsync()
                print("a")
                print(a)
            } catch {
                print("Error")
            }
        })
    }
    
    func loadUsingAsync() async throws -> String {
        let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album")
        
        let session = URLSession.shared
        let (data, _) = try await session.data(from: url!)
        print("___ data")
        dump(data)
        let str = String(decoding: data, as: UTF8.self)
        return str
    }


}

