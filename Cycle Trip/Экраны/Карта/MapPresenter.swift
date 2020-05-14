//
//  MapPresenter.swift
//  MapTesting
//
//  Created by Igor Lebedev on 13/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections
import Mapbox

class MapPresenter {
    var model: MapModel
    var mapView: NavigationMapView!
    var coordinates = [CLLocationCoordinate2D]()
    init(mapView: NavigationMapView, model: MapModel) {
        self.mapView = mapView
        self.model = model
    }

    func longPress(coordinate: CLLocationCoordinate2D) {
        self.coordinates.append(coordinate)
        let annotation = MGLPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Start navigation"
        mapView.addAnnotation(annotation)

        
        // Calculate the route from the user's location to the set destination
        if coordinates.count > 1 {
            model.calculateRoute(coordinates: self.coordinates) { (route, error) in
                if error != nil {
                    print("Error calculating route") }
            }
        }
    }
    
    func drawRoute(route: Route) {
        guard route.coordinateCount > 0 else { return }
        // Convert the route’s coordinates into a polyline
        var routeCoordinates = route.coordinates!
        let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: route.coordinateCount)
        
        // If there's already a route line on the map, reset its shape to the new route
        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource {
            source.shape = polyline
        } else {
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
            
            // Customize the route line color and width
            let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
            lineStyle.lineColor = NSExpression(forConstantValue: #colorLiteral(red: 0.1897518039, green: 0.3010634184, blue: 0.7994888425, alpha: 1))
            lineStyle.lineWidth = NSExpression(forConstantValue: 3)
            
            // Add the source and style layer of the route line to the map
            mapView.style?.addSource(source)
            mapView.style?.addLayer(lineStyle)
        }
    }
    func annotationBuilder(title: String, imageName: String, coordinate: CLLocationCoordinate2D) {
//        // Create a basic point annotation and add it to the map
//        let annotation = MGLPointAnnotation()
//        var image = UIImage(named: imageName)!
//        image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: image.size.height / 2, right: 0))
//        annotation.coordinate = coordinate
//        annotation.title = "Start navigation"
//        mapView.addAnnotation(annotation)
        
    }
}
