//
//  MainWorker.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation
import UIKit

protocol MainWorkerLogic {
  func createMainTabBarItems() -> [UIViewController]
}

final class MainWorker: BaseWorker, MainWorkerLogic {
  func createMainTabBarItems() -> [UIViewController] {
    let feedViewController = FeedViewController().then {
      $0.title = "Feed"
    }
    
    let userViewController = UserViewController().then {
      $0.title = "User"
    }
    
    return [feedViewController, userViewController]
  }
}
