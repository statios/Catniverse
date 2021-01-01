//
//  MapContainerNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class MapContainerNode: BaseNode {
  private let mapNode = MapNode()
  private let overlayNode = MapOverlayNode()
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let mapLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: mapNode
    )
    
    let overlayLayout = ASInsetLayoutSpec(
      insets: .init(top: 40 + 16, left: 16, bottom: 24 + 16, right: 16),
      child: overlayNode
    )
    
    return ASOverlayLayoutSpec(
      child: mapLayout,
      overlay: overlayLayout
    )
  }
}
