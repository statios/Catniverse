//
//  UIView+.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/29.
//

import Foundation
import UIKit

extension UIView {
  @discardableResult
  func add(to: UIView) -> UIView {
    to.addSubview(self)
    return self
  }
}
