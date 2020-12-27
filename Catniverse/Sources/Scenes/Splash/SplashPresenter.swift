//
//  SplashPresenter.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import UIKit

protocol SplashPresentationLogic: class {
  
}

final class SplashPresenter: BasePresenter {
  
  weak var view: SplashDisplayLogic?

}


// MARK: - Presentation Logic

extension SplashPresenter: SplashPresentationLogic {
  
}
