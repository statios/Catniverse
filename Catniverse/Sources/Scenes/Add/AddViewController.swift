//
//  AddViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol AddDisplayLogic: class {

}

final class AddViewController: BaseASViewController {

  @Injected var interactor: AddBusinessLogic
  @Injected var router: (AddRoutingLogic & AddDataPassing)
  
}

// MARK: - Configure
extension AddViewController {
  override func configure() {
    if let router = router as? AddRouter,
       let interactor = interactor as? AddInteractor,
       let presenter = interactor.presenter as? AddPresenter {
      router.viewController = self
      presenter.viewController = self
    }
    view.backgroundColor = .white
  }
}

// MARK: - Layout
extension AddViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASLayoutSpec()
  }
}

// MARK: - Request
extension AddViewController {
  
}

// MARK: - Display
extension AddViewController: AddDisplayLogic {

}
