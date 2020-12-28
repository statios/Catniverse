//
//  FeedWorker.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation
import CoreLocation

protocol FeedWorkerLogic {
  func getCurrentLocation() -> CLLocationCoordinate2D?
}

final class FeedWorker: BaseWorker, FeedWorkerLogic {
  
  private lazy var locationManager = CLLocationManager().then {
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.requestWhenInUseAuthorization()
    $0.startUpdatingLocation()
  }
  
  func getCurrentLocation() -> CLLocationCoordinate2D? {
    locationManager.location?.coordinate
  }
  
}
