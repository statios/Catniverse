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
import MapKit

protocol FeedDisplayLogic: class {

}

final class FeedViewController: BaseASViewController {

  @Injected var interactor: FeedBusinessLogic
  @Injected var router: (FeedRoutingLogic & FeedDataPassing)

  private let mapContainerNode = MapContainerNode()
  private let feedNode = BaseNode().then {
    $0.backgroundColor = .blue
    $0.style.preferredSize = CGSize(width: Device.width, height: Device.width - 88)
  }

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
      child: mapContainerNode
    ).then {
      $0.style.flexGrow = 1
    }
    
    let feedNodeLayout = ASInsetLayoutSpec(
      insets: .init(top: 0, left: 0, bottom: bottomHeight, right: 0),
      child: feedNode
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
