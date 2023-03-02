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
                }
                Image("testImage")
                    .resizable()
                    .frame(width: 370, height: 250)
                HStack {
                    Text(restautant.adress)
                    NavigationLink(destination: MapView(restaurant: restautant)
                        .ignoresSafeArea(.all), label: {
                        Text("Смотреть на карте")
                    })
                    Spacer()
                }.padding(.leading, 30)
                HStack {
                    Text(String(restautant.points!))
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, 30)
                Text("Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором.")
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
                Spacer(minLength: 80)
                
            }.padding()
        }
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
