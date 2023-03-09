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
        annotation.subtitle = restaurant.address
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
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        fileprivate init(_ parent: MapView) {
            self.parent = parent
        }
    }
}
