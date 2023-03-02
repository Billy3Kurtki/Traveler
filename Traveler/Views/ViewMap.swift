//
//  MapView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 02.03.2023.
//

import SwiftUI

import MapKit

struct MapView: UIViewRepresentable {
    
    var restaurant: Restaurant
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let annotation = MKPointAnnotation()
        annotation.title = restaurant.name
        annotation.subtitle = restaurant.adress
        annotation.coordinate = CLLocationCoordinate2DMake(restaurant.latitude, restaurant.longitude)
        mapView.addAnnotation (annotation)
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: restaurant.latitude, longitude: restaurant.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.001)
                let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
    
}

struct ViewMap: View {
    var restaurant = Restaurant(name: "Bebra", adress: "Snikers Avenue", points: 2.5, latitude: 52.377956, longitude: 4.897070)
    var body: some View {
        
        MapView(restaurant: restaurant)
            .ignoresSafeArea(.all)
    }
}

struct ViewMap_Previews: PreviewProvider {
    static var previews: some View {
        ViewMap()
    }
}
