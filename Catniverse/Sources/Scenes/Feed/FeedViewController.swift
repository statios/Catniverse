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

  private let mapNode = FeedMapNode()
  private let feedNode = FeedBottomNode()
}

// MARK: - Configure
extension FeedViewController {
  override func configure() {
    guard let router = router as? FeedRouter,
          let interactor = interactor as? FeedInteractor,
          let presenter = interactor.presenter as? FeedPresenter else { return }
    router.viewController = self
    presenter.viewController = self
  }
}

// MARK: - Layout
extension FeedViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    let mapNodeLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: self.mapNode
    ).then {
      $0.style.flexGrow = 1
    }
    
    let feedNodeLayout = ASInsetLayoutSpec(
      insets: .init(top: 0, left: 0, bottom: bottomHeight, right: 0),
      child: self.feedNode
    )
    
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: -24,
      justifyContent: .start,
      alignItems: .stretch,
      children: [mapNodeLayout, feedNodeLayout]
    )
  }
}

// MARK: - Request
extension FeedViewController {
  
}

// MARK: - Display
extension FeedViewController: FeedDisplayLogic {

}
