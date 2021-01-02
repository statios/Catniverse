//
//  AddInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2021/01/02.
//

import Foundation
import Resolver

protocol AddDataStore: class {
  
}

protocol AddBusinessLogic: class {

}

final class AddInteractor: BaseInteractor, AddDataStore {

//  var worker: AddWorkerLogic?
  @Injected var presenter: AddPresentationLogic

}

// MARK: - Business Logic
extension AddInteractor: AddBusinessLogic {

}
