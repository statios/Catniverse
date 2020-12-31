//
//  FeedViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol FeedDisplayLogic: class {

}

final class FeedViewController: BaseASViewController {

  @Injected var interactor: FeedBusinessLogic
  @Injected var router: (FeedRoutingLogic & FeedDataPassing)

  private let mapNode = BaseNode().then {
    $0.backgroundColor = .blue
  }
  
  private let feedNode = BaseNode().then {
    $0.backgroundColor = .blue
  }
}

// MARK: - Configure
extension FeedViewController {
  override func configure() {
    if let router = router as? FeedRouter,
       let interactor = interactor as? FeedInteractor,
       let presenter = interactor.presenter as? FeedPresenter {
      router.viewController = self
      presenter.viewController = self
    }
    
    node.layoutSpecBlock = { (_, _) in
      return ASLayoutSpec()
    }
  }
}

// MARK: - Request
extension FeedViewController {
  
}

// MARK: - Display
extension FeedViewController: FeedDisplayLogic {

}
