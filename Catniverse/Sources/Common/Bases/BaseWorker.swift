//
//  BaseWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

class BaseWorker {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
}

