//
//  SplashViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit

protocol SplashDisplayLogic: class {

}

final class SplashViewController: BaseASViewController {

  // MARK: VIP

  var router: (SplashRoutingLogic & SplashDataPassing)?
  var interactor: SplashBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = SplashInteractor()
    let presenter = SplashPresenter()
    let router = SplashRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = SplashWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}


// MARK: - Display Logic

extension SplashViewController: SplashDisplayLogic {

}
