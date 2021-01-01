//
//  BaseASNavigationController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import Foundation
import AsyncDisplayKit

class BaseASNavigationController: ASNavigationController {
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
