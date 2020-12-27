//
//  FeedRouter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol FeedRoutingLogic: class {

}

protocol FeedDataPassing: class {

  var dataStore: FeedDataStore? { get set }
}

final class FeedRouter: BaseRouter, FeedDataPassing {

  weak var viewController: FeedViewController?
  var dataStore: FeedDataStore?

}


// MARK: - Routing Logic

extension FeedRouter: FeedRoutingLogic {

}
