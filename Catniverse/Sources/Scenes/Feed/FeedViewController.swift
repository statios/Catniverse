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
import NMapsMap
import PhotosUI

protocol FeedDisplayLogic: class {
  func displayCurrentLocation(viewModel: FeedModels.CurrentLocation.ViewModel)
  func displayPhotoPicker(viewModel: FeedModels.PhotoPicker.ViewModel)
}

final class FeedViewController: BaseASViewController {

  @Injected var interactor: FeedBusinessLogic
  @Injected var router: (FeedRoutingLogic & FeedDataPassing)

  var addNavigationController: BaseASNavigationController?
  private let mapContainerNode = MapContainerNode()
  private let feedNode = BaseNode().then {
    $0.backgroundColor = .red
    $0.style.preferredSize = CGSize(width: Device.width, height: Device.width - 88)
    $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    $0.layer.cornerRadius = 24
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
    
    [requestCurrentLocation(trigger: rx.viewDidAppear.asObservableVoid.take(1)),
     requestCurrentLocation(trigger: mapContainerNode.locationButtonNode.rx.tap.asObservableVoid),
     requestPhotoPicker(trigger: mapContainerNode.addButtonNode.rx.tap.asObservableVoid)
    ].forEach { $0.disposed(by: disposeBag) }
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
  func requestCurrentLocation(trigger: Observable<Void>) -> Disposable {
    trigger.bind { [weak self] in self?.interactor.fetchCurrentLocation(request: .init()) }
  }
  func requestPhotoPicker(trigger: Observable<Void>) -> Disposable {
    trigger.bind { [weak self] in self?.interactor.fetchPhotoPicker(request: .init()) }
  }
}

// MARK: - Display
extension FeedViewController: FeedDisplayLogic {
  func displayCurrentLocation(viewModel: FeedModels.CurrentLocation.ViewModel) {
    mapContainerNode.mapNode.mapView?.moveCamera(viewModel.cameraUpdate)
  }
  
  func displayPhotoPicker(viewModel: FeedModels.PhotoPicker.ViewModel) { 
    if let vc = viewModel.navigationController {
      addNavigationController = vc
      addNavigationController?.view.backgroundColor = .white
      present(vc, animated: true)
    } else if let _ = viewModel.asset?.location?.coordinate {
      //사진이 위치정보를 포함 - router에서 datapass
      let viewController = AddViewController()
      viewController.title = "정보 입력"
      addNavigationController?.pushViewController(viewController, animated: true)
    } else {
      addNavigationController?.showAlert(message: "위치 정보가 포함된 사진만 등록할 수 있어요!")
    }
  }
}
