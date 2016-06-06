//
//  FirstViewController.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/6/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit
import GoogleMaps

class FirstViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func loadView() {
        super.loadView()
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if (authorizationStatus == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestWhenInUseAuthorization()
        } else if (authorizationStatus == CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController : CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
        
        if (status == CLAuthorizationStatus.AuthorizedWhenInUse) {
            manager.startUpdatingLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            manager.stopUpdatingLocation()
        }
    }
}

