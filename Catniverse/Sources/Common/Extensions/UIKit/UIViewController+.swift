//
//  UIViewController+.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/29.
//

import Foundation
import UIKit

extension UIViewController {
  var bottomHeight: CGFloat {
    let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
    let bottomSafeAreaHeight = UIApplication.shared
      .windows.first { $0.isKeyWindow }?
      .safeAreaInsets.bottom ?? 0
    return tabBarHeight + bottomSafeAreaHeight
  }
}
