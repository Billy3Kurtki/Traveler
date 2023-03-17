//
//  RestaurantSnippetViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 17.03.2023.
//

import Foundation

final class RestaurantSnippetViewModel {
    var restaurant: RestaurantSnippet
    
    init(name: String, country: String, city: String, street: String, points: Float) {
        restaurant = RestaurantSnippet(name: name, fullAddress: "\(country), \(city), \(street).", points: points)
    }
}
