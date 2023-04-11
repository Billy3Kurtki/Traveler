//
//  SwiftUIView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 13.03.2023.
//

import SwiftUI

struct RestaurantCardView: View {
    var restaurant: RestaurantCardViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack{
                    Text(restaurant.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.leading, Consts.paddingLow)
                ImageTabView(with: restaurant)
                VStack {
                    HStack {
                        Text(restaurant.address)
                        Spacer()
                    }
                    MiniMapView(with: restaurant)
                    Spacer()
                }.padding()
                HStack {
                    Text(String(restaurant.points!))
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, Consts.paddingMedium)
                DescriptionView(with: restaurant)
            }.padding()
        }
    }
    
    @State private var showFullText = false
    @State private var selectedImageIndex = 0
    @State private var timer = Timer.publish(every: Consts.timerPeriod, on: .main, in: .common).autoconnect()
    
    private func ImageTabView(with vm: RestaurantCardViewModel) -> some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<vm.images.count) { image in
                Image("\(vm.images[image].url)")
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
                    selectedImageIndex = selectedImageIndex < vm.images.count ? selectedImageIndex + 1 : 0
                }
            })
    }
    
    private func MiniMapView(with vm: RestaurantCardViewModel) -> some View {
        NavigationLink(destination: RestaurantMapView(restaurant: RestaurantMapViewModel(id: vm.id))
            .ignoresSafeArea(.all), label: {
                RestaurantMiniMapView(restaurant: RestaurantMapViewModel(id: vm.id))
                    .frame(width: 300, height: 300)
                    .border(Color.gray, width: 1)
                    .allowsHitTesting(false)
            })
    }
    
    private func DescriptionView(with vm: RestaurantCardViewModel) -> some View {
        VStack {
            Text(vm.description)
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
        }
        
    }
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
}


