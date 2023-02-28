//
//  ViewModelRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import Foundation

class ViewModelRestaurant: ObservableObject {
    @Published var restaurants = [Restaurant]()
    
    func defaultData() {
        restaurants = [
            Restaurant(name: "Bebra", adress: "Ul.bebrova", points: 4.5),
            Restaurant(name: "Soho", adress: "Ul.keglina", points: 0),
            Restaurant(name: "BebraHouse", adress: "Ul.vafelkina", points: 3.25),
            Restaurant(name: "StakeHouse", adress: "Ul.igorkina", points: 4)
        ]
    }
}
