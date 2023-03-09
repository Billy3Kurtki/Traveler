//
//  ViewModelRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import Foundation

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants = [Restaurant]()
    
    func fetchData() async -> [Restaurant] {
        return [
            Restaurant(name: "Bebra", address: "Ul.bebrova", points: 4.5, latitude: 52.477956, longitude: 4.897070),
            Restaurant(name: "Soho", address: "Ul.keglina", points: 0, latitude: 52.371956, longitude: 4.897070),
            Restaurant(name: "StakeHouse", address: "Ul.igorkina", points: 4, latitude: 52.375956, longitude: 4.897070),
            Restaurant(name: "BebraHouse", address: "Ul.vafelkina", points: 3.25, latitude: 52.367956, longitude: 4.897070)
        ]
    }
}
