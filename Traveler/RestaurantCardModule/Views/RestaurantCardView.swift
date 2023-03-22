//
//  SwiftUIView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import SwiftUI

struct RestaurantCardView: View {
    var restaurant: RestaurantModel
    private enum Layout {
        static let opacityFull: CGFloat = 1
        static let opacityNull: CGFloat = 0
        static let unrolledTextHeight: CGFloat = 90
    }

    private enum Consts {
        static let paddingLow: CGFloat = 10
        static let paddingMedium: CGFloat = 30
        static let timerPeriod: CFTimeInterval = 3
    }
    @State private var showFullText = false
    @State private var selectedImageIndex = 0
    @State private var timer = Timer.publish(every: Consts.timerPeriod, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack{
                    Text(restaurant.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, Consts.paddingLow)
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<restaurant.images.count) { image in
                        Image("\(restaurant.images[image].url)")
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
                            selectedImageIndex = selectedImageIndex < restaurant.images.count ? selectedImageIndex + 1 : 0
                        }
                        
                    })
                VStack {
                    HStack {
                        Text("\(restaurant.country), \(restaurant.city), \(restaurant.street)")
                        Spacer()
                    }
                    NavigationLink(destination: RestaurantMapView(restaurant: restaurant)
                        .ignoresSafeArea(.all), label: {
                            RestaurantMapView(restaurant: restaurant)
                                .frame(width: 300, height: 300)
                                .border(Color.gray, width: 1)
                                .allowsHitTesting(false)
                        })
                    Spacer()
                }.padding()
                HStack {
                    Text(String(restaurant.points!))
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, Consts.paddingMedium)
                Text(restaurant.description)
                    .onTapGesture {
                        self.showFullText = true
                    }
                    .frame(width: 350, height: showFullText ? nil : Layout.unrolledTextHeight)
                    .truncationMode(.tail)
                HStack {
                    Button(action: {
                        self.showFullText = false
                    }) {
                        Text("Скрыть")
                    }.opacity(showFullText ? Layout.opacityFull : Layout.opacityNull)
                    Spacer()
                }.padding(.leading, Consts.paddingLow)
            }.padding()
        }
    }
}

