//
//  RestaurantMiniMapView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 23.03.2023.
//

import SwiftUI
import MapKit

struct RestaurantMiniMapView: UIViewRepresentable {
    
    var restaurant: RestaurantMapViewModel
    
    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        let annotation = MKPointAnnotation()
        annotation.title = restaurant.name
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
    
}
