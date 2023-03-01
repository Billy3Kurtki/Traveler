//
//  ViewRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import SwiftUI

struct SubViewRestaurant: View {
    @Environment(\.dismiss) var dismiss
    var restautant: Restaurant
    var images = ["testImage", "russia-flag-xs", "testImage", "russia-flag-xs"]
    @State private var selectedImage = 0
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text(restautant.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Image("testImage")
                .resizable()
                .frame(width: 370, height: 250)
            HStack {
                Text(restautant.adress)
                Spacer()
            }.padding(.leading, 30)
            HStack {
                Text(String(restautant.points!))
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                Spacer()
            }.padding(.leading, 30)
            Spacer()
        }.padding()
    }
}

struct ViewRestaurant: View {
    @ObservedObject var rest = ViewModelRestaurant()
    @State private var isShow = false
    var body: some View {
        NavigationStack {
                List(rest.restaurants) { restaurant in
                    NavigationLink(destination: SubViewRestaurant(restautant: restaurant), label: {
                        HStack {
                            Image("russia-flag-xs")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 40, height: 40)
                                .clipShape(Capsule())
                            VStack(alignment: .leading) {
                                Text(restaurant.name)
                                    .foregroundColor(.black)
                                Text(restaurant.adress)
                                    .foregroundColor(.gray)
                            }.padding(.leading, 10)
                            Spacer()
                            Text(String(restaurant.points!))
                                .foregroundColor(.black)
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                        }
                    })
                    .navigationTitle("Restautants")
                }.onAppear {
                    rest.defaultData()
                }
            
            
        }
        
    }
}

struct ViewRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        ViewRestaurant()
    }
}
