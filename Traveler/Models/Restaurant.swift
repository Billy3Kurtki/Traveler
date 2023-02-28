//
//  Restaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 27.02.2023.
//

import Foundation

class Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var adress: String
    var points: Float?
    
    init(name: String, adress: String, points: Float) {
        self.name = name
        self.adress = adress
        self.points = points
    }
}
