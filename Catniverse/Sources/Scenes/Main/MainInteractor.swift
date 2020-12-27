//
//  MainInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol MainBusinessLogic: class {
  func fetchTabBarItems(request: MainModels.FetchTabBarItems.Request)
}

protocol MainDataStore: class {

}

final class MainInteractor: BaseInteractor, MainDataStore {

  var worker: MainWorkerLogic?
  var presenter: MainPresentationLogic?

}


// MARK: - Business Logic

extension MainInteractor: MainBusinessLogic {
  func fetchTabBarItems(request: MainModels.FetchTabBarItems.Request) {
    guard let worker = worker else { return }
    presenter?.presentFetchedTabBarItems(
      response: .init(viewControllers: worker.createMainTabBarItems())
    )
  }
}
