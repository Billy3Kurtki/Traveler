//
//  RestaurantMapViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

final class RestaurantMapViewModel: Identifiable {
    let id: String
    let name: String
    let address: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    
    init(id: String) {
        let list = FetchDataClass().fetchData()
        
        if let restaurant = list.first(where: {$0.id == id}) {
            self.id = restaurant.id
            self.name = restaurant.name
            self.address = "\(restaurant.country), \(restaurant.city), \(restaurant.street)"
            self.points = restaurant.points
            self.latitude = restaurant.latitude
            self.longitude = restaurant.longitude
        }
        else {
            self.id = "0"
            self.name = "default"
            self.address = "default"
            self.points = 0
            self.latitude = 25.4
            self.longitude = 25.4
        }
    }
}
