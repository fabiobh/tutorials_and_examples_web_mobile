//
//  APICaller.swift
//  CombineTutorial
//
//  Created by fabiocunha on 08/08/22.
//

import Foundation
import Combine

class APICaller {
    static let shared = APICaller()
    
    func fetchData() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promise(.success(["Apple", "Google", "Microsoft", "Facebook"]))
            }
        }
    }
    
    func fetchDataV2() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                promise(.success(["Apple 2", "Google 2", "Microsoft 2", "Facebook 2"]))
            }
        }
    }
}
