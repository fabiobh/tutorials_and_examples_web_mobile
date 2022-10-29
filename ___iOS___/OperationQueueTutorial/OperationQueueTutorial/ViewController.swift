//
//  ViewController.swift
//  OperationQueueTutorial
//
//  Created by fabiocunha on 06/06/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: queue)
    }()

    let queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .userInitiated
        return queue
    }()
    
    var observer: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        observer = queue.observe(\.operationCount, options: .new) { queue, change in
//            print("Observer reported operationCount =", change.newValue!)
//        }
         
        /*
        for i in 1000..<1050 {
            let url = URL(string: "https://httpbin.org/get?value=\(i)")!
            session.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error ?? URLError(.badServerResponse))
                    return
                }

                print("Request", i, "returned", data.count, "bytes")
            }.resume()
        }
        */
        
        print("start")
        
        let operation1 = BlockOperation {
            print("Operation 1 is starting")
            Thread.sleep(forTimeInterval: 1)
            print("Operation 1 is finishing")
        }

        let operation2 = BlockOperation {
            print("Operation 2 is starting")
            Thread.sleep(forTimeInterval: 1)
            print("Operation 2 is finishing")
        }
        
        print("Adding operations")
        let queue = OperationQueue()
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.waitUntilAllOperationsAreFinished()
        print("Done!")
        
        for i in 1000..<1010 {
            let url = URL(string: "https://httpbin.org/get?value=\(i)")!
            let a = session.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error ?? URLError(.badServerResponse))
                    return
                }

                Thread.sleep(forTimeInterval: 1)
                print("Request", i, "returned", data.count, "bytes")
            }.resume()
            queue.addOperation { a }
 
         }

        
    }


}

