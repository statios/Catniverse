//
//  AddViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit

protocol AddDisplayLogic: class {

}

final class AddViewController: BaseASViewController {

  // MARK: VIP

  var router: (AddRoutingLogic & AddDataPassing)?
  var interactor: AddBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = AddInteractor()
    let presenter = AddPresenter()
    let router = AddRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = AddWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
    
    view.backgroundColor = .red
  }
}


// MARK: - Display Logic

extension AddViewController: AddDisplayLogic {

}
