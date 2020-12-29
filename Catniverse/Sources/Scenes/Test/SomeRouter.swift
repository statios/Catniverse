//
//  SomeRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/30.
//

import UIKit

protocol SomeRoutingLogic: class {

}

protocol SomeDataPassing: class {

  
}

final class SomeRouter: BaseRouter, SomeDataPassing {

  weak var viewController: SomeViewController?
  

}


// MARK: - Routing Logic

extension SomeRouter: SomeRoutingLogic {

}
