//
//  RestaurantSnippetViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 17.03.2023.
//

import Foundation

final class RestaurantSnippetViewModel {
    let id = UUID()
    let name: String
    let fullAddress: String
    let points: Float?
    
    init(name: String, country: String, city: String, street: String, points: Float) {
        self.name = name
        self.fullAddress = "\(country), \(city), \(street)."
        self.points = points
    }
}
