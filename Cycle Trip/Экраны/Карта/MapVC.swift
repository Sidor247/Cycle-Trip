//
//  NavigationViewController.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 04/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import MapboxNavigation
import Mapbox
import PinLayout


final class MapVC: UIViewController, MGLMapViewDelegate {
    var mapView: MGLMapView = {
        let map = MGLMapView()
        map.styleURL = URL(string: "mapbox://styles/sid0r247/ck95uvmu95fhz1ioahpaf3n0t")
        map.logoViewPosition = .topLeft
        map.attributionButtonPosition = .topRight
        return map
    }()
    var presenter: MapPresenter!
    var coordinates = [CLLocationCoordinate2D]()
    private var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Создать событие", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MapPresenter(mapVC: self)
        
        // Set the map view's delegate
        mapView.delegate = self
        
        // Add a gesture recognizer to the map view
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        mapView.addGestureRecognizer(longPress)
        view.addSubview(mapView)
        view.addSubview(startButton)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.pin.all()
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true, completionHandler: nil)
        startButton.pin
            .bottom(view.pin.safeArea.bottom + 20)
            .horizontally(30)
            .height(40)
        startButton.layer.cornerRadius = startButton.bounds.midY
        startButton.clipsToBounds = true
    }
    
    @objc private func tappedButton(sender: UIButton) {
        let navVC = NavVC()
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
        navVC.presenter = presenter
    }
    
    @objc private func didLongPress(_ sender: UILongPressGestureRecognizer) {
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
