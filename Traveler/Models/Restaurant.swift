//
//  Restaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 27.02.2023.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var points: Float?
    var latitude: Double
    var longitude: Double
    
    init(name: String, adress: String, points: Float, latitude: Double, longitude: Double) {
        self.name = name
        self.address = adress
        self.points = points
        self.latitude = latitude
        self.longitude = longitude
    }
}
