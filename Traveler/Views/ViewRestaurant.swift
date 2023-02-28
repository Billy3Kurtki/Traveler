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
    var images = ["testImage", "testImage", "testImage", "testImage"]
    @State private var selectedImage = 0
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("Back")
                }.padding(.horizontal,20)
                .padding(.top, 20)
            }
            HStack{
                Text(restautant.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Picker(selection: $selectedImage, label: Text("bebra")) {
                ForEach(0..<images.count) { element in
                    Image(self.images[element])
                        .resizable()
                        .frame(width: 350, height: 250)
                        
                }
            }.pickerStyle(.menu)
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
            VStack {
                List(rest.restaurants) { restaurant in
                    Button(action: {
                        self.isShow.toggle()
                    }) {
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
                        .navigationTitle("Restourants")
                    }
                    .sheet(isPresented: $isShow) {
                        SubViewRestaurant(restautant: restaurant)
                    }
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
