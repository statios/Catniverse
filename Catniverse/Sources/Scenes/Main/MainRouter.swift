//
//  MainRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol MainRoutingLogic: class {

}

protocol MainDataPassing: class {

  var dataStore: MainDataStore? { get set }
}

final class MainRouter: BaseRouter, MainDataPassing {

  weak var viewController: MainViewController?
  var dataStore: MainDataStore?

}


// MARK: - Routing Logic

extension MainRouter: MainRoutingLogic {
  
}
