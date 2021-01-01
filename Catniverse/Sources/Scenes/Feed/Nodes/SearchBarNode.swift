//
//  SearchBarNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class SearchBarNode: BaseNode {
  
  let textFieldNode = TextFieldNode()
  
  let searchButtonNode = ASButtonNode().then {
    $0.style.preferredSize = CGSize(width: 24, height: 24)
    $0.backgroundColor = .red
  }
  
  override init() {
    super.init()
    style.preferredSize.height = 40
    backgroundColor = .white
    cornerRadius = 20
    textFieldNode.textField?.placeholder = "Search..."
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let textFieldNodeLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: textFieldNode
    ).then {
      $0.style.flexGrow = 1
    }
    
     let stackLayout = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 8,
      justifyContent: .start,
      alignItems: .stretch,
      children: [textFieldNodeLayout, searchButtonNode]
    )
    
    return ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 16),
      child: stackLayout
    )
  }
}
