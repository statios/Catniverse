//
//  FeedNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class FeedBottomNode: BaseNode {
  
  override init() {
    super.init()
    backgroundColor = .red
    cornerRadius = 24
    maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    cornerRoundingType = .precomposited
    style.preferredSize = CGSize(width: Device.width, height: Device.width - 88)
  }
  
//  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//    <#code#>
//  }
}
