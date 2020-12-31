//
//  FeedMapNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit
import MapKit

class FeedMapNode: BaseNode {
  private let mapView = MKMapView()
  override init() {
    super.init()
    setViewBlock { [weak self] in self?.mapView ?? UIView() }
  }
}
