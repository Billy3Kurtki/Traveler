//
//  RestaurantListModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

struct RestaurantListModel: Identifiable {
    var id = UUID()
    let name: String
    let fullAddress: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    let description: String
    let images: [Images]
}

