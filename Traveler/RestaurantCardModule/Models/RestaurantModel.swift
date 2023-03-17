//
//  Restaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 27.02.2023.
//

import Foundation

struct RestaurantModel: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let city: String
    let street: String
    let points: Float?
    let latitude: Double
    let longitude: Double
    let description: String
    let images: [Images]
}

struct Images { //не хочу менять на Image, тк придётся во всех вью писать Image(url: URL(string: "sss")!), вместо Image("sss")
    let url: URL
}

