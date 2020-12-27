//
//  UserRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol UserRoutingLogic: class {

}

protocol UserDataPassing: class {

  var dataStore: UserDataStore? { get set }
}

final class UserRouter: BaseRouter, UserDataPassing {

  weak var viewController: UserViewController?
  var dataStore: UserDataStore?

}


// MARK: - Routing Logic

extension UserRouter: UserRoutingLogic {

}
