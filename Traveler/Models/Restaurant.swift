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
    var description: String
}
