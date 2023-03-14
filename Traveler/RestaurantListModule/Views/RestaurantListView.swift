//
//  ViewRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var rest = RestaurantListViewModel()
    @State private var isShow = false
    var body: some View {
        NavigationStack {
                List(rest.restaurants) { restaurant in
                    NavigationLink(destination: RestaurantCardView(restautant: restaurant), label: {
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
