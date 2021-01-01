//
//  FeedModels.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//
import CoreLocation

enum FeedModels {

  enum CurrentLocation {

    struct Request {
    }

    struct Response {
      let coordinate: CLLocationCoordinate2D?
    }

    struct ViewModel {
      let coordinate: CLLocationCoordinate2D
    }
  }
}
