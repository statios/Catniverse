//
//  FeedViewController.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import AsyncDisplayKit
import CoreLocation
import NMapsMap
import RxSwift

protocol FeedDisplayLogic: class {
  func displayCurrentLocation(viewModel: FeedModels.UpdateCurrentLocation.ViewModel)
}

final class FeedViewController: BaseASViewController {
  
  // MARK: Contatns
  
  fileprivate struct Metric {
    static let mapSize: CGSize = .init(width: Device.width, height: Device.height/2)
    static let feedSize: CGSize = .init(width: Device.width, height: Device.height/2)
  }
  
  // MARK: VIP
  
  var router: (FeedRoutingLogic & FeedDataPassing)?
  var interactor: FeedBusinessLogic?
  
  // MARK: Nodes
  
  private let mapView = NMFMapView().then {
    $0.positionMode = .direction
  }
  private let feedContainerNode = BaseNode().then {
    $0.backgroundColor = .red
    $0.view.layer.cornerRadius = 24
    $0.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    $0.style.preferredSize = Metric.feedSize
  }
  
  private lazy var mapNode = BaseNode { self.mapView }.then { _ in
//    $0.style.preferredSize = Metric.mapSize
  }
  
  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = FeedInteractor()
    let presenter = FeedPresenter()
    let router = FeedRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = FeedWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
    
    node.layoutSpecBlock = { [weak self] (_, _) in
      guard let `self` = self else { return ASLayoutSpec() }
      let map = ASInsetLayoutSpec(
        insets: .zero,
        child: self.mapNode
      ).then {
        $0.style.flexGrow = 1
        $0.style.flexShrink = 0
      }
      let vStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 0,
        justifyContent: .start,
        alignItems: .stretch,
        children: [map, self.feedContainerNode]
      )
      return ASInsetLayoutSpec(
        insets: .init(top: 0, left: 0, bottom: self.bottomHeight, right: 0),
        child: vStack
      )
    }
  }
  
  override func sendRequest() {
    super.sendRequest()
    Observable.merge(rx.viewDidAppear.take(1))
      .subscribe(onNext: { [weak self] _ in
        self?.interactor?.fetchCurrentLocation(request: .init())
      }).disposed(by: disposeBag)
  }
}


// MARK: - Display Logic

extension FeedViewController: FeedDisplayLogic {
  func displayCurrentLocation(viewModel: FeedModels.UpdateCurrentLocation.ViewModel) {
    mapView.moveCamera(viewModel.cameraUpdate)
  }
}
