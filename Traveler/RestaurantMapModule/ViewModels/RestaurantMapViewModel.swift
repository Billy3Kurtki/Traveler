//
//  RestaurantMapViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

final class RestaurantMapViewModel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    
    init(restaurant: RestaurantModel) {
        self.name = restaurant.name
        self.address = "\(restaurant.country), \(restaurant.city), \(restaurant.street)"
        self.points = restaurant.points
        self.latitude = restaurant.latitude
        self.longitude = restaurant.longitude
    }
}
