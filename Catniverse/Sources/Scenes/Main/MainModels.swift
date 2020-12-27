//
//  MainModels.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

enum MainModels {
  
  enum FetchTabBarItems {
    struct Request {
    }
    struct Response {
      let viewControllers: [UIViewController]
    }
    struct ViewModel {
      let viewControllers: [UIViewController]
    }
  }
}
