//
//  FeedPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//

import UIKit

protocol FeedPresentationLogic: class {
  func presentCurrentLocation(response: FeedModels.CurrentLocation.Response)
}

final class FeedPresenter: BasePresenter {
  
  weak var viewController: FeedDisplayLogic?

}


// MARK: - Present
extension FeedPresenter: FeedPresentationLogic {
  func presentCurrentLocation(response: FeedModels.CurrentLocation.Response) {
    guard let coordinate = response.coordinate else {
      Log.warning("No location")
      return
    }
    viewController?.displayCurrentLocation(viewModel: .init(coordinate: coordinate))
  }
}
