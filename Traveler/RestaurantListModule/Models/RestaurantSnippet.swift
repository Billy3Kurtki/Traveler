//
//  RestaurantListModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import Foundation

struct RestaurantSnippet: Identifiable {
    let id = UUID()
    let name: String
    let fullAddress: String
    let points: Float?
}

