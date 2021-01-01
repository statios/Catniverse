//
//  PHPickerWorker.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import Foundation
import PhotosUI
import RxSwift
import RxCocoa

protocol PHPickerWorkerLogic: class {
  var pickerViewController: PHPickerViewController { get set }
  var selectedAsset: PublishSubject<PHAsset> { get set }
}

final class PHPickerWorker: BaseWorker, PHPickerWorkerLogic {
  private lazy var pickerConfiguration = PHPickerConfiguration(photoLibrary: .shared())
  lazy var pickerViewController = PHPickerViewController(configuration: pickerConfiguration).then {
    $0.delegate = self
  }
  
  var selectedAsset = PublishSubject<PHAsset>()
}

extension PHPickerWorker: PHPickerViewControllerDelegate {
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    guard let imageResult = results.first else {
      picker.dismiss(animated: true)
      return
    }
    
    guard let assetId = imageResult.assetIdentifier,
          let asset = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil).firstObject else {
      return
    }
    
    selectedAsset.onNext(asset)
  }
}
