//
//  MainPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol MainPresentationLogic: class {
  func presentFetchedTabBarItems(response: MainModels.FetchTabBarItems.Response)
}

final class MainPresenter: BasePresenter {
  
  weak var view: MainDisplayLogic?

}


// MARK: - Presentation Logic

extension MainPresenter: MainPresentationLogic {
  func presentFetchedTabBarItems(response: MainModels.FetchTabBarItems.Response) {
    view?.displayFetchedTabBarItems(
      viewModel: .init(viewControllers: response.viewControllers)
    )
  }
}
