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
    
    let addViewController = AddViewController().then {
      $0.title = "Add"
    }
    
    let userViewController = UserViewController().then {
      $0.title = "User"
    }
    return [feedViewController, addViewController, userViewController]
  }
}
