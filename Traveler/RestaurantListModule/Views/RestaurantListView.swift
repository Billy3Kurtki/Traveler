//
//  ViewRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var vm = RestaurantListViewModel()
    func getFullModel(restaurant: RestaurantSnippet) -> RestaurantModel {
        @ObservedObject var vm = RestaurantCardViewModel()
        let list = vm.restaurants
        
        if let r = list.first(where: {$0.name == restaurant.name}) {
            return r
        }
        return RestaurantModel(name: "default", country: "default", city: "default", street: "default", points: 0, latitude: 25.4, longitude: 24.2, description: "default", images: [])
    }
    var body: some View {
        NavigationStack {
            List(vm.restaurants) { restaurant in
                NavigationLink(destination: RestaurantCardView(restaurant: getFullModel(restaurant: restaurant))
                , label: {
                    HStack {
                        Image("russia-flag-xs")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .clipShape(Capsule())
                        VStack(alignment: .leading) {
                            Text(restaurant.name)
                                .foregroundColor(.black)
                            Text(restaurant.fullAddress)
                                .foregroundColor(.gray)
                        }.padding(.leading, 10)
                        Spacer()
                        Text(String(restaurant.points!))
                            .foregroundColor(.black)
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                    }
                })
                .navigationTitle("Restaurants")
            }
        }
        
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
