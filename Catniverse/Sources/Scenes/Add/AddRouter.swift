//
//  AddRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol AddRoutingLogic: class {

}

protocol AddDataPassing: class {

  var dataStore: AddDataStore? { get set }
}

final class AddRouter: BaseRouter, AddDataPassing {

  weak var viewController: AddViewController?
  var dataStore: AddDataStore?

}


// MARK: - Routing Logic

extension AddRouter: AddRoutingLogic {

}
