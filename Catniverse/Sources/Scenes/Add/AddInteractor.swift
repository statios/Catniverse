//
//  AddInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol AddBusinessLogic: class {

}

protocol AddDataStore: class {

}

final class AddInteractor: BaseInteractor, AddDataStore {

  var worker: AddWorkerLogic?
  var presenter: AddPresentationLogic?

}


// MARK: - Business Logic

extension AddInteractor: AddBusinessLogic {

}
