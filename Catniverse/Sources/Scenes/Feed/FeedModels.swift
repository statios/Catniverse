//
//  FeedModels.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import NMapsMap

enum FeedModels {

  enum UpdateCurrentLocation {

    struct Request {
      
    }

    struct Response {
      let coordinate: CLLocationCoordinate2D?
    }

    struct ViewModel {
      let cameraUpdate: NMFCameraUpdate
    }
  }
}
