//
//  RestaurantListViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 14.03.2023.
//

import Foundation

class RestaurantListViewModel: ObservableObject {
    @Published var restaurants = [RestaurantListModel]()
    
    init() {
        let rest = RestaurantViewModel().restaurants
        var k = 0
        while(k < rest.count) {
            restaurants.append(RestaurantListModel(name: rest[k].name, fullAddress: "\(rest[k].country), \(rest[k].city), \(rest[k].street).", points: rest[k].points, latitude: rest[k].latitude, longitude: rest[k].longitude, description: rest[k].description))
            k += 1
        }
    }
}
