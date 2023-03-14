//
//  RestaurantListModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

struct RestaurantListModel: Identifiable {
    var id = UUID()
    var name: String
    var fullAddress: String
    var points: Float?
    var latitude: Double
    var longitude: Double
    var description: String
}
