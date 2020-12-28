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
  
  // MARK: VIP
  
  var router: (FeedRoutingLogic & FeedDataPassing)?
  var interactor: FeedBusinessLogic?
  
  // MARK: Nodes
  
  private let mapView = NMFMapView().then {
    $0.positionMode = .direction
  }
  private let feedContainerNode = BaseNode().then {
    $0.backgroundColor = .red
    $0.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    $0.cornerRadius = 24
  }
  
  private lazy var mapNode = BaseNode { self.mapView }
  
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
    
    node.addSubnode(mapNode)
    node.layoutSpecBlock = { (_, _) in
      ASInsetLayoutSpec(insets: .zero, child: self.mapNode)
    }
  }
  
  override func sendRequest() {
    super.sendRequest()
    Observable.merge(rx.viewWillAppear.take(1))
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
