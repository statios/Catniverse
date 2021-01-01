//
//  FeedPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//

import UIKit
import NMapsMap
import PhotosUI

protocol FeedPresentationLogic: class {
  func presentCurrentLocation(response: FeedModels.CurrentLocation.Response)
  func presentPhotoPicker(response: FeedModels.PhotoPicker.Response)
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
    let location = NMGLatLng(
      lat: coordinate.latitude,
      lng: coordinate.longitude
    )
    let cameraUpdate = NMFCameraUpdate(scrollTo: location)
    cameraUpdate.animation = .easeIn
    viewController?.displayCurrentLocation(viewModel: .init(cameraUpdate: cameraUpdate))
  }
  
  func presentPhotoPicker(response: FeedModels.PhotoPicker.Response) {
    if let pickerViewController = response.pickerViewController {
      
      let navigationController = BaseASNavigationController(rootViewController: pickerViewController)
      pickerViewController.title = "냥 사진 고르긔"
      navigationController.navigationBar.prefersLargeTitles = true
      navigationController.modalPresentationStyle = .overFullScreen
      viewController?.displayPhotoPicker(
        viewModel: .init(
          navigationController: navigationController,
          asset: response.asset
        )
      )
      
    } else {
      
      viewController?.displayPhotoPicker(
        viewModel: .init(
          navigationController: nil,
          asset: response.asset
        )
      )
      
    }
  }
}
