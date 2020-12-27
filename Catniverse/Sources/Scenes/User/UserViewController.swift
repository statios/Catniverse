//
//  UserViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit

protocol UserDisplayLogic: class {

}

final class UserViewController: BaseASViewController {

  // MARK: VIP

  var router: (UserRoutingLogic & UserDataPassing)?
  var interactor: UserBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = UserInteractor()
    let presenter = UserPresenter()
    let router = UserRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = UserWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}


// MARK: - Display Logic

extension UserViewController: UserDisplayLogic {

}
