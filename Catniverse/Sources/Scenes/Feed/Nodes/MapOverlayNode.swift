//
//  MapOverlayNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class MapOverlayNode: BaseNode {
  private let searchBarNode = SearchBarNode()
  private let locationButtonNode = LocationButtonNode()
  private let addButtonNode = AddButtonNode()
  
  override init() {
    super.init()
    isUserInteractionEnabled = false
  }
}

extension MapOverlayNode {
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let searchBarNodeLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [searchBarNode]
    ).then {
      $0.style.flexGrow = 1
    }
    let buttonsStackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0,
      justifyContent: .spaceBetween,
      alignItems: .baselineLast,
      children: [locationButtonNode, addButtonNode]
    )
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [searchBarNodeLayout, buttonsStackLayout]
    )
  }
}
