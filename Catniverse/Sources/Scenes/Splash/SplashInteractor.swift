//
//  SplashInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol SplashBusinessLogic: class {

}

protocol SplashDataStore: class {

}

final class SplashInteractor: BaseInteractor, SplashDataStore {

  var worker: SplashWorkerLogic?
  var presenter: SplashPresentationLogic?

}


// MARK: - Business Logic

extension SplashInteractor: SplashBusinessLogic {

}
