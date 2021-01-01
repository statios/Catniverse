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
}

final class FeedInteractor: BaseInteractor, FeedDataStore {

  @Injected var locationWorker: LocationWorker
  @Injected var presenter: FeedPresentationLogic

}

// MARK: - Business Logic
extension FeedInteractor: FeedBusinessLogic {
  func fetchCurrentLocation(request: FeedModels.CurrentLocation.Request) {
    let coordinate = locationWorker.fetchCurrentLocationCoordinate()
    presenter.presentCurrentLocation(response: .init(coordinate: coordinate))
  }
}
