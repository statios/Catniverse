//
//  FeedInteractor.swift
//  Catniverse
//
//  Created by KIHYUN SO on 2020/12/28.
//

import Foundation

protocol FeedBusinessLogic: class {
  
}

protocol FeedDataStore: class {

}

final class FeedInteractor: BaseInteractor, FeedDataStore {

  var worker: FeedWorkerLogic?
  var presenter: FeedPresentationLogic?

}


// MARK: - Business Logic

extension FeedInteractor: FeedBusinessLogic {
    
}
