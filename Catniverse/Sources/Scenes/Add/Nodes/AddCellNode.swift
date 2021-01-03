//
//  AddCellNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/03.
//

import Foundation
import AsyncDisplayKit

protocol AddCellNodeDelegate: class {
  func onEditing()
}

final class AddCellNode: BaseCellNode {
  weak var delegate: AddCellNodeDelegate?
  
  private let titleNode = ASTextNode()
  private let inputNode = TextFieldNode().then {
    $0.style.preferredSize.height = 40
  }
  
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
  
  override func didLoad() {
    inputNode.textField?.placeholder = "Say something..."
    inputNode.textField?.borderStyle = .roundedRect
    inputNode.textField?.rx
      .controlEvent(.editingDidBegin)
      .subscribe(onNext: { [weak self] in
        self?.delegate?.onEditing()
      }).disposed(by: disposeBag)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let titleNodeLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: titleNode
    )
    
    let inputNodeLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: inputNode
    )
    
    let vStack = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 8,
      justifyContent: .start,
      alignItems: .stretch,
      children: [titleNodeLayout, inputNodeLayout]
    )
    
    return ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 16),
      child: vStack
    )
  }
}
