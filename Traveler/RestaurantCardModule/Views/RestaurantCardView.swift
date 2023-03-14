//
//  SwiftUIView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import SwiftUI

struct RestaurantCardView: View {
    var restautant: RestaurantListModel
    var images = ["testImage", "testImage", "testImage", "testImage"]
    @State private var showFullText = false
    @State private var selectedImage = 0
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack{
                    Text(restautant.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, 10)
                TabView(selection: $selectedImage) {
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
                    .onReceive(timer, perform: { _ in
                        withAnimation {
                            selectedImage = selectedImage < images.count ? selectedImage + 1 : 0
                        }
                        
                    })
                VStack {
                    HStack {
                        Text(restautant.fullAddress)
                        Spacer()
                    }
                    NavigationLink(destination: RestaurantMapView(restaurant: restautant)
                        .ignoresSafeArea(.all), label: {
                            RestaurantMapView(restaurant: restautant)
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

