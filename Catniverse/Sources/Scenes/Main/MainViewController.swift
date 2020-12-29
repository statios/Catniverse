//
//  MainViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

//import AsyncDisplayKit

protocol MainDisplayLogic: class {
  func displayFetchedTabBarItems(viewModel: MainModels.FetchTabBarItems.ViewModel)
}

final class MainViewController: BaseAsTabBarController {

  // MARK: VIP

  var router: (MainRoutingLogic & MainDataPassing)?
  var interactor: MainBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = MainWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}

// MARK: - Send Request

extension MainViewController {
  override func sendRequest() {
    super.sendRequest()
    rx.viewWillAppear.take(1)
      .subscribe(onNext: { [weak self] _ in
        self?.interactor?.fetchTabBarItems(request: .init())
      }).disposed(by: disposeBag)
  }
}

// MARK: - Display Logic

extension MainViewController: MainDisplayLogic {
  func displayFetchedTabBarItems(viewModel: MainModels.FetchTabBarItems.ViewModel) {
    viewControllers = viewModel.viewControllers
  }
}
