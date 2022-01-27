//
//  ViewController.swift
//  visizovPW7
//
//  Created by user on 27.01.2022.
//

import UIKit
import CoreLocation
import MapKit

final class MapController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(mapView)
        
        configureUI()
        


    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.layer.masksToBounds = true
        mapView.layer.cornerRadius = 5
        mapView.clipsToBounds = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsBuildings = true
        mapView.showsUserLocation = true

        
        return mapView
    } ()
    
    private func configureUI() {
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
     }
    
    


}

