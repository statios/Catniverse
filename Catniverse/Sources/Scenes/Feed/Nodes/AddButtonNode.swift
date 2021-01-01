//
//  AddButtonNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class AddButtonNode: BaseNode {
  override init() {
    super.init()
    style.preferredSize = CGSize(width: 40, height: 40)
    cornerRadius = 20
    backgroundColor = .white
  }
}
