//
//  SplashRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol SplashRoutingLogic: class {

}

protocol SplashDataPassing: class {

  var dataStore: SplashDataStore? { get set }
}

final class SplashRouter: BaseRouter, SplashDataPassing {

  weak var viewController: SplashViewController?
  var dataStore: SplashDataStore?

}


// MARK: - Routing Logic

extension SplashRouter: SplashRoutingLogic {

}
