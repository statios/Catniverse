//
//  BaseNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import AsyncDisplayKit

class BaseNode: ASDisplayNode {
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
  }
}
