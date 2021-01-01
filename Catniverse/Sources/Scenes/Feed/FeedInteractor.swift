//
//  FeedInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//

import Foundation
import Resolver

protocol FeedDataStore: class {

}

protocol FeedBusinessLogic: class {
  func fetchCurrentLocation(request: FeedModels.CurrentLocation.Request)
  func fetchPhotoPicker(request: FeedModels.PhotoPicker.Request)
}

final class FeedInteractor: BaseInteractor, FeedDataStore {

  @Injected var locationWorker: LocationWorkerLogic
  @Injected var phpickerWorker: PHPickerWorkerLogic
  @Injected var presenter: FeedPresentationLogic
  
  override init() {
    super.init()
    phpickerWorker.selectedAsset
      .bind { [weak self] in
        self?.presenter.presentPhotoPicker(response: .init(pickerViewController: nil, asset: $0))
      }.disposed(by: disposeBag)
  }

}

// MARK: - Business Logic
extension FeedInteractor: FeedBusinessLogic {
  func fetchCurrentLocation(request: FeedModels.CurrentLocation.Request) {
    let coordinate = locationWorker.fetchCurrentLocationCoordinate()
    presenter.presentCurrentLocation(response: .init(coordinate: coordinate))
  }
  
  func fetchPhotoPicker(request: FeedModels.PhotoPicker.Request) {
    let viewController = phpickerWorker.pickerViewController
    presenter.presentPhotoPicker(response: .init(pickerViewController: viewController, asset: nil))
  }
}
