//
//  MapContainerNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit
import NMapsMap

class MapNode: BaseNode {
  
  var mapView: NMFMapView? {
    return view as? NMFMapView
  }
  
  override init() {
    super.init()
    setViewBlock {
      NMFMapView().then {
        $0.positionMode = .direction
      }
    }
  }
  
}
