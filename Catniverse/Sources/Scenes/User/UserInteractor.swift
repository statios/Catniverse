//
//  UserInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol UserBusinessLogic: class {

}

protocol UserDataStore: class {

}

final class UserInteractor: BaseInteractor, UserDataStore {

  var worker: UserWorkerLogic?
  var presenter: UserPresentationLogic?

}


// MARK: - Business Logic

extension UserInteractor: UserBusinessLogic {

}
