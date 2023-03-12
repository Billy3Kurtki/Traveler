//
//  ViewRestaurant.swift
//  Traveler
//
//  Created by Кирилл Казаков on 28.02.2023.
//

import SwiftUI

struct RestaurantSubView: View {
    var restautant: Restaurant
    var images = ["testImage", "testImage", "testImage", "testImage"]
    @State private var showFullText = false
    @State private var selectedImage = 0
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack{
                    Text(restautant.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 10)
                TabView {
                    ForEach(0..<images.count) { image in
                        Image("\(images[image])")
                            .resizable()
                            .scaledToFill()
                            .overlay(Color.black.opacity(0.4))
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .padding()
                    .frame(width: 390, height: 250)
                VStack {
                    HStack {
                        Text(restautant.address)
                        Spacer()
                    }
                    NavigationLink(destination: MapView(restaurant: restautant)
                        .ignoresSafeArea(.all), label: {
                            MapView(restaurant: restautant)
                                .frame(width: 300, height: 300)
                                .border(Color.gray, width: 1)
                                .allowsHitTesting(false)
                        })
                    Spacer()
                }.padding()
                HStack {
                    Text(String(restautant.points!))
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, 30)
                Text(restautant.description)
                    .onTapGesture {
                        self.showFullText = true
                    }
                    .frame(width: 350, height: showFullText ? nil : 90)
                    .truncationMode(.tail)
                HStack {
                    Button(action: {
                        self.showFullText = false
                    }) {
                        Text("Скрыть")
                    }.opacity(showFullText ? 1 : 0)
                    Spacer()
                }.padding(.leading, 10)
            }.padding()
        }
    }
}

struct RestaurantView: View {
    @ObservedObject var rest = RestaurantViewModel()
    @State private var isShow = false
    var body: some View {
        NavigationStack {
                List(rest.restaurants) { restaurant in
                    NavigationLink(destination: RestaurantSubView(restautant: restaurant), label: {
                        HStack {
                            Image("russia-flag-xs")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 40, height: 40)
                                .clipShape(Capsule())
                            VStack(alignment: .leading) {
                                Text(restaurant.name)
                                    .foregroundColor(.black)
                                Text(restaurant.address)
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
                    Task {
                        rest.restaurants = await rest.fetchData()
                    }
                }
        }
        
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView()
    }
}
