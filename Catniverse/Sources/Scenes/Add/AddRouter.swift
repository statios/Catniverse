//
//  AddRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import UIKit
import Resolver

protocol AddRoutingLogic: class {

}

protocol AddDataPassing: class {
  var dataStore: AddDataStore { get set }
}

final class AddRouter: BaseRouter, AddDataPassing {

  @Injected var dataStore: AddDataStore
  weak var viewController: AddViewController?

}

// MARK: - Route
extension AddRouter: AddRoutingLogic {

}

// MARK: - Register
extension AddRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { AddInteractor() }
      .implements(AddDataStore.self)
      .implements(AddBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { AddRouter() }
      .implements((AddRoutingLogic & AddDataPassing).self)
    Resolver.register { AddPresenter() }
      .implements(AddPresentationLogic.self)
  }
}
