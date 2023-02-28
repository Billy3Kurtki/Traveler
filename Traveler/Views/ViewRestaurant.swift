//
//  ViewRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import SwiftUI

struct ViewRestaurant: View {
    @ObservedObject var rest = ViewModelRestaurant()
    var body: some View {
        NavigationStack {
            VStack {
                List(rest.restaurants) { restaurant in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(restaurant.name)
                            Text(restaurant.adress)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(String(restaurant.points!))
                    }
                    
                    .navigationTitle("Restourants")
                    
                }.onAppear {
                    rest.defaultData()
                }
            }
        }
    }
}

struct ViewRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        ViewRestaurant()
    }
}
