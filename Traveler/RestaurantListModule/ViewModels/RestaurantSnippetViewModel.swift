//
//  RestaurantSnippetViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 17.03.2023.
//

import Foundation

final class RestaurantSnippetViewModel {
    let id: String
    let name: String
    let fullAddress: String
    let points: Float?
    
    init(id: String, name: String, country: String, city: String, street: String, points: Float) {
        self.id = id
        self.name = name
        self.fullAddress = "\(country), \(city), \(street)."
        self.points = points
    }
}
