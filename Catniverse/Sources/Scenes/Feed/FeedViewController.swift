//
//  FeedViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit

protocol FeedDisplayLogic: class {

}

final class FeedViewController: BaseASViewController {

  // MARK: VIP

  var router: (FeedRoutingLogic & FeedDataPassing)?
  var interactor: FeedBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = FeedInteractor()
    let presenter = FeedPresenter()
    let router = FeedRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = FeedWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}


// MARK: - Display Logic

extension FeedViewController: FeedDisplayLogic {

}
