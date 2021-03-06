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
  
  var topHeight: CGFloat {
    let topSafeAreaHeight = UIApplication.shared
      .windows.first { $0.isKeyWindow }?
      .safeAreaInsets.top ?? 0
    let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
    return topSafeAreaHeight + navigationBarHeight
  }
  
  func showAlert(title: String? = nil,
                 message: String? = nil,
                 button: String? = "확인",
                 handler: ((UIAlertAction) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: button, style: .default, handler: handler)
    alertController.addAction(alertAction)
    present(alertController, animated: true)
  }
}
