//
//  BaseCellNode.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/03.
//

import Foundation
import AsyncDisplayKit
import RxSwift

class BaseCellNode: ASCellNode {
  
  var disposeBag = DisposeBag()
  
  override init() {
    super.init()
    automaticallyManagesSubnodes = true
  }
}

