//
//  MapContainerNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit
import MapKit

class MapNode: BaseNode {
  
  var mapView: MKMapView? {
    return view as? MKMapView
  }
  
  override init() {
    super.init()
    setViewBlock { MKMapView() }
  }
  
}
