//
//  FeedModels.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/31.
//
import CoreLocation
import NMapsMap
import PhotosUI

enum FeedModels {

  enum CurrentLocation {
    struct Request { }
    struct Response {
      let coordinate: CLLocationCoordinate2D?
    }
    struct ViewModel {
      let cameraUpdate: NMFCameraUpdate
    }
  }
   
  enum PhotoPicker {
    struct Request { }
    struct Response {
      let pickerViewController: PHPickerViewController?
      let asset: PHAsset?
    }
    struct ViewModel {
      let navigationController: BaseASNavigationController?
      let asset: PHAsset?
    }
  }
}
