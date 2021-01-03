//
//  AddCellNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/03.
//

import Foundation
import AsyncDisplayKit

final class AddCellNode: BaseCellNode {
  private let titleNode = ASTextNode()
  
  func configure(bio: Bio?) {
    titleNode.backgroundColor = .brown
    titleNode.attributedText = NSAttributedString(
      string: bio?.title ?? "",
      attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15),
        NSAttributedString.Key.foregroundColor: UIColor.black
      ]
    )
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 16),
      child: titleNode
    )
  }
}
