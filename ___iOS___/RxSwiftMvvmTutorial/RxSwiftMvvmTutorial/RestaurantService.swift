//
//  RestaurantService.swift
//  RxSwiftMvvmTutorial
//
//  Created by fabiocunha on 09/08/22.
//

import RxSwift
import Darwin
import Foundation

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService : RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json")
            else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let restaurants: [Restaurant] = try! JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
                
            } catch(let error) {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
    }
}
