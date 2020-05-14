//
//  MapModel.swift
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

class MapModel {
    var presenter: MapPresenter!
    var directionsRoute: Route?
    func calculateRoute(coordinates: [CLLocationCoordinate2D],
                        completion: @escaping (Route?, Error?) -> ()) {
        
        // Coordinate accuracy is the maximum distance away from the waypoint that the route may still be considered viable, measured in meters. Negative values indicate that a indefinite number of meters away from the route and still be considered viable.
        var points = [Waypoint]()
        points.append(Waypoint(coordinate: coordinates[0], coordinateAccuracy: -1, name: "Start"))
        for i in 1..<coordinates.count-1 {
            points.append(Waypoint(coordinate: coordinates[i], coordinateAccuracy: -1, name: "Waypoint"))
        }
        points.append(Waypoint(coordinate: coordinates[coordinates.count-1], coordinateAccuracy: -1, name: "Finish"))
        
        // Specify that the route is intended for automobiles avoiding traffic
        let options = NavigationRouteOptions(waypoints: points, profileIdentifier: .walking)
        
        // Generate the route object and draw it on the map
        Directions.shared.calculate(options) { [unowned self] (waypoints, routes, error) in
            guard error == nil else { print(error!.localizedDescription); return}
            self.directionsRoute = routes?.first
            // Draw the route on the map after creating it
            self.presenter.drawRoute(route: self.directionsRoute!)
        }

    }
    
}
