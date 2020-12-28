//
//  FeedInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol FeedBusinessLogic: class {
  func fetchCurrentLocation(request: FeedModels.UpdateCurrentLocation.Request)
}

protocol FeedDataStore: class {

}

final class FeedInteractor: BaseInteractor, FeedDataStore {

  var worker: FeedWorkerLogic?
  var presenter: FeedPresentationLogic?

}


// MARK: - Business Logic

extension FeedInteractor: FeedBusinessLogic {
  func fetchCurrentLocation(request: FeedModels.UpdateCurrentLocation.Request) {
    presenter?.createCameraUpdate(
      response: .init(coordinate: worker?.getCurrentLocation())
    )
  }
}
