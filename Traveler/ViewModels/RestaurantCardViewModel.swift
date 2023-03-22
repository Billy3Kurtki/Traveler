//
//  ViewModelRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import Foundation

final class RestaurantCardViewModel: ObservableObject {
    @Published var restaurants = [RestaurantModel]()
    
    init() {
        restaurants = [
            RestaurantModel(name: "Bebra", country: "Russia", city: "Moscow", street: "Ul.bebrova", points: 4.5, latitude: 52.477956, longitude: 4.897070, description: "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором.", images: [ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "russia-flag-xs")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "russia-flag-xs")!)]),
            RestaurantModel(name: "Soho", country: "Russia", city: "Moscow", street: "Ul.keglina", points: 0, latitude: 52.371956, longitude: 4.897070, description: "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором.", images: [ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!)]),
            RestaurantModel(name: "StakeHouse", country: "Russia", city: "Moscow", street: "Ul.igorkina", points: 4, latitude: 52.375956, longitude: 4.897070, description: "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором.", images: [ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!)]),
            RestaurantModel(name: "BebraHouse", country: "Russia", city: "Moscow", street: "Ul.vafelkina", points: 3.25, latitude: 52.367956, longitude: 4.897070, description: "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генерато-ром.", images: [ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!), ImageModel(url: URL(string: "testImage")!)])
        ]
    }
}
