//
//  SearchBarNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/01.
//

import Foundation
import AsyncDisplayKit

class SearchBarNode: BaseNode {
  override init() {
    super.init()
    style.preferredSize.height = 48
    cornerRadius = 24
    backgroundColor = .white
  }
}
