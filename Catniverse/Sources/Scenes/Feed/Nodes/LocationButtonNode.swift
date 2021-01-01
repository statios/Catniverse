//
//  CurrentLocationButtonNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class LocationButtonNode: BaseNode {
  override init() {
    super.init()
    style.preferredSize = CGSize(width: 32, height: 32)
    cornerRadius = 8
    backgroundColor = .white
  }
}
