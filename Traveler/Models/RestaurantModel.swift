//
//  Restaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 27.02.2023.
//

import Foundation

struct RestaurantModel: Identifiable {
    var id = UUID()
    let name: String
    let country: String
    let city: String
    let street: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    let description: String
    let images: [Images]
}

struct Images {
    var id = UUID()
    let name: String
}
