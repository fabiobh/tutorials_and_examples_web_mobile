//
//  RestaurantsLisViewModel.swift
//  RxSwiftMvvmTutorial
//
//  Created by fabiocunha on 09/08/22.
//

import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService        
    }
    
    func fetchRestaurantViewModel() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map{ $0.map {
            RestaurantViewModel(restaurant: $0)
        } }
    }
}
