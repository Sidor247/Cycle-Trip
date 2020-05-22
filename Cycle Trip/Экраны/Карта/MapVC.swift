//
//  NavigationViewController.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 04/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections
import Mapbox
import PinLayout


class MapVC: UIViewController, MGLMapViewDelegate {
    var mapView: NavigationMapView!
    var presenter: MapPresenter!
    var coordinates = [CLLocationCoordinate2D]()
    var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Создать событие", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        btn.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = NavigationMapView(frame: view.bounds)
        
        let model = MapModel()
        presenter = MapPresenter(mapView: mapView, model: model)
        model.presenter = presenter
        
        
        view.addSubview(mapView)
        
        // Set the map view's delegate
        mapView.delegate = self
        mapView.styleURL = URL(string: "mapbox://styles/sid0r247/ck95uvmu95fhz1ioahpaf3n0t")
        
        // Allow the map to display the user's location
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true, completionHandler: nil)
        
        // Add a gesture recognizer to the map view
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        mapView.addGestureRecognizer(longPress)
        view.addSubview(startButton)
        startButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    startButton.layer.cornerRadius = startButton.bounds.midY
    startButton.clipsToBounds = true
     
    }
    
    @objc func tappedButton(sender: UIButton) {
        let eventCreation = NavVC()
        eventCreation.modalPresentationStyle = .fullScreen
        present(eventCreation, animated: true, completion: nil)
    }
    
    @objc func didLongPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        
        // Converts point where user did a long press to map coordinates
        let point = sender.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        startButton.isHidden = false
        presenter.longPress(coordinate: coordinate)
    }
    
    
    // Implement the delegate method that allows annotations to show callouts when tapped
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    // Present the navigation view controller when the callout is selected
    func mapView(_ mapView: MGLMapView, tapOnCalloutFor annotation: MGLAnnotation) {
        let navigationViewController = NavigationViewController(for: presenter.directionsRoute!)
        navigationViewController.modalPresentationStyle = .fullScreen
        self.present(navigationViewController, animated: true, completion: nil)
    }
    
}
