//
//  RestaurantCardModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

struct RestaurantMapModel: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let city: String
    let street: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    let description: String
    let images: [ImageModel]
}
