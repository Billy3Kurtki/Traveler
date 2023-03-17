//
//  MapView.swift
//  Traveler
//
//  Created by Кирилл Казаков on 02.03.2023.
//

import SwiftUI

import MapKit

struct RestaurantMapView: UIViewRepresentable {
    
    var restaurant: RestaurantModel
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let annotation = MKPointAnnotation()
        annotation.title = restaurant.name
        annotation.subtitle = "\(restaurant.country), \(restaurant.city), \(restaurant.street)" //сделано так, поскольку осн модель юзал(не прошедшую через вьюМодель
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
        var parent: RestaurantMapView
        fileprivate init(_ parent: RestaurantMapView) {
            self.parent = parent
        }
    }
}
