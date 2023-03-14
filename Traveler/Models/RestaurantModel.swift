//
//  Restaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 27.02.2023.
//

import Foundation

struct RestaurantModel: Identifiable {
    var id = UUID()
    var name: String
    var country: String
    var city: String
    var street: String
    var points: Float?
    var latitude: Double
    var longitude: Double
    var description: String
}
