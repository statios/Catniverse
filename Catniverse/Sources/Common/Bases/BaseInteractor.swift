//
//  BaseInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import RxSwift

class BaseInteractor {
  var disposeBag = DisposeBag()
  
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
    disposeBag = DisposeBag()
  }
}
