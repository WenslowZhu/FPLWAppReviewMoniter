//
//  VehicleLocationView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/13.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import MapKit
import SwiftUI
import CoreLocation

final class MapView: NSObject, UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = self
        mapView.isScrollEnabled = false
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let location = CLLocationCoordinate2D(latitude: 31.22, longitude: 121.48)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: false)
        
        uiView.removeAnnotations(uiView.annotations)
        let newAnotation = VehicleAnotation(coordinate: location)
        uiView.addAnnotation(newAnotation)
    }
}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Vehicle")
        anotationView.image = UIImage(named: FordICONProvider.vehicle.vehicleLocation)
        return anotationView
    }
}

private class VehicleAnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
