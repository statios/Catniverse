//
//  MapContainerNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit
import MapKit

class MapContainerNode: BaseNode {
  
  let mapNode = MapNode()
  let searchBarNode = SearchBarNode()
  let locationButtonNode = ASButtonNode().then {
    $0.style.preferredSize = CGSize(width: 32, height: 32)
    $0.cornerRadius = 8
    $0.backgroundColor = .red
    $0.isUserInteractionEnabled = true
  }
  let addButtonNode = ASButtonNode().then {
    $0.style.preferredSize = CGSize(width: 48, height: 48)
    $0.cornerRadius = 24
    $0.backgroundColor = .red
    $0.isUserInteractionEnabled = true
  }
  
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
    
    let overlayLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [searchBarNodeLayout, buttonsStackLayout]
    )
    
    let overlayLayoutWithPadding = ASInsetLayoutSpec(
      insets: .init(top: Device.safeAreaInset.top + 16, left: 16, bottom: 24 + 16, right: 16),
      child: overlayLayout
    )
    
    let mapLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: mapNode
    )
    
    return ASOverlayLayoutSpec(
      child: mapLayout,
      overlay: overlayLayoutWithPadding
    )
  }
}
