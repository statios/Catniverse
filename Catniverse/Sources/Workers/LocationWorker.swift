//
//  LocationWorker.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import CoreLocation
import MapKit

protocol LocationWorkerLoginc: class {
  func fetchCurrentLocationCoordinate() -> CLLocationCoordinate2D?
}

final class LocationWorker: NSObject, LocationWorkerLoginc {
  private lazy var locationManager = CLLocationManager().then {
    $0.delegate = self
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.requestWhenInUseAuthorization()
    $0.startUpdatingLocation()
  }
}

extension LocationWorker: CLLocationManagerDelegate {
  func fetchCurrentLocationCoordinate() -> CLLocationCoordinate2D? {
    
    return locationManager.location?.coordinate
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
  }
}
