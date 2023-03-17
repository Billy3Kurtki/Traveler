//
//  RestaurantListViewModel.swift
//  Traveler
//
//  Created by Кирилл Казаков on 14.03.2023.
//

import Foundation

final class RestaurantListViewModel: ObservableObject {
    @Published var restaurants = [RestaurantSnippet]()
    
    init() {
        let rest = RestaurantCardViewModel().restaurants
        var k = 0
        while(k < rest.count) {
            let item = RestaurantSnippetViewModel(
                name: rest[k].name,
                country: rest[k].country,
                city: rest[k].city,
                street: rest[k].street,
                points: rest[k].points ?? 0)
            restaurants.append(item.restaurant)
            k += 1
        }
    }
}
