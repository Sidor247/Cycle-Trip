//
//  MapController.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 16/04/2020.
//  Copyright © 2020 BubbleGum. All rights reserved.
//


import UIKit
import Mapbox
 
class MapController: UIViewController, MGLMapViewDelegate {
    override func viewDidLoad() {
    super.viewDidLoad()
    tabBarItem = UITabBarItem(title: "Карта", image: nil , selectedImage: nil)
    let url = URL(string: "mapbox://styles/sid0r247/ck95uvmu95fhz1ioahpaf3n0t")
    let mapView = MGLMapView(frame: view.bounds, styleURL: url)
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapView.setCenter(CLLocationCoordinate2D(latitude: 55.789, longitude: 37.793), zoomLevel: 16, animated: true)
    view.addSubview(mapView)


    let annotation = MGLPointAnnotation()
    annotation.coordinate = CLLocationCoordinate2D(latitude: 40.77014, longitude: -73.97480)
    annotation.title = "Central Park"
    annotation.subtitle = "The biggest park in New York City!"
    mapView.addAnnotation(annotation)
     
    // Set the map view's delegate
    mapView.delegate = self
     
    // Allow the map view to display the user's location
    mapView.showsUserLocation = true
    }
     
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
    // Always allow callouts to popup when annotations are tapped.
    return true
    }
     
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
    let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 4500, pitch: 15, heading: 180)
    mapView.fly(to: camera, withDuration: 4,
    peakAltitude: 3000, completionHandler: nil)
    }
}

