//
//  FeedPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit
import NMapsMap

protocol FeedPresentationLogic: class {
  func createCameraUpdate(response: FeedModels.UpdateCurrentLocation.Response)
}

final class FeedPresenter: BasePresenter {
  
  weak var view: FeedDisplayLogic?

}


// MARK: - Presentation Logic

extension FeedPresenter: FeedPresentationLogic {
  func createCameraUpdate(response: FeedModels.UpdateCurrentLocation.Response) {
    let position = NMGLatLng(
      lat: response.coordinate?.latitude ?? 0.0,
      lng: response.coordinate?.longitude ?? 0.0
    )
    let cameraUpdate = NMFCameraUpdate(scrollTo: position)
    cameraUpdate.animation = .easeIn
    view?.displayCurrentLocation(viewModel: .init(cameraUpdate: cameraUpdate))
  }
}
